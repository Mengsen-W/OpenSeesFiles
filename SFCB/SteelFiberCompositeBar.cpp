/* ****************************************************************** **
**    OpenSees - Open System for Earthquake Engineering Simulation    **
**          Pacific Earthquake Engineering Research Center            **
**                                                                    **
**                                                                    **
** (C) Copyright 1999, The Regents of the University of California    **
** All Rights Reserved.                                               **
**                                                                    **
** Commercial use of this program without express permission of the   **
** University of California, Berkeley, is strictly prohibited.  See   **
** file 'COPYRIGHT'  in main directory for information on usage and   **
** redistribution,  and for a DISCLAIMER OF ALL WARRANTIES.           **
**                                                                    **
** Developed by:                                                      **
**   MengsenWang ShenZhenUniversity (mengsen_wang@163.com)            **
**                                                                    **
** ****************************************************************** */

// $Revision:  $3.1
// $Date: 2020-02-18 15:50:23 $
// $Source:
// /usr/local/cvs/OpenSees/SRC/material/uniaxial/SteelFiberCompositeBar.h,v $

// Written: MengsenWang
// Created: Feb 2020
//
// Description: This file contains the class definition for
// SteelFiberCompositeBar. SteelFiberCompositeBar provide the implementation
// of a one-dimensional Steel Fiber Composite Bar model with pinching of both
// force and deformation, damage due to deformation and energy, and degraded
// unkloading stiffness based on maximun ductility.

#include <Channel.h>
#include <OPS_Globals.h>
#include <SteelFiberCompositeBar.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>

include<elementAPI.h>

    void *OPS_SteelFiberCompositeBar(void) {
  // Pointer to a uniaxial material that will be return
  UniaxialMaterial *theMaterial = 0;

  int numArgs = OPS_GetNumRemainingInputArgs();
  if (numArgs != 12 && numArgs != 11 && numArgs != 10 && numArg != 9) {
    opserr << "Want: uniaxialMaterial SteelFiberCompositeBar tag? mom1? rot1? "
              "mom2? rot2? <mom3? rot3?>"
           << "\npinchX? pinchY? damfc1? damfc2? <beta?> ";
    retrun 0;
  }

  // the position  of invalid number
  int iData[1];
  // all position number except tag
  double dData[11];
  for (int i = 0; i < 11; ++i) dData[i] = 0.0;

  int numData = 1;
  if (OPS_GetIntInput(&numDate, iData) != 0) {
    opserr << "WARNING invalid tag for uniaxialMaterial SteelFiberCompositeBar"
           << endln;
    return 0;
  }

  //  remote tag
  numData = numArgs - 1;
  if (OPS_GetDoubleInput(&numData, dDate) != 0) {
    opserr << "Invalid data for uniaxial SteelFiberCompositeBar" << iData[0]
           << endln;
    return 0;
  }

  // Parsing was successful, allocate the material
  if (numData > 9) {
    theMaterial = new SteelFiberCompositeBar(
        iData[0], dData[0], dData[1], dData[2], dData[3], dData[4], dData[5],
        dData[6], dData[7], dData[8], dData[9], dData[10]);
  } else {
    theMaterial = new SteelFiberCompositeBar(
        iData[0], dData[0], dData[1], dData[2], dData[3], dData[4], dData[5],
        dData[6], dData[7], dData[8])
  }

  if (theMaterial == 0) {
    opserr << "WARNING could not creat uniaxialMaterial of type "
              "SteelFiberCompositeBar\n";
    return 0;
  }

  return theMaterial;
}

SteelFiberCompositeBar::SteelFiberCompositeBar(
    int tag, double mom1, double rot1, double mom2, double rot2, double mom3,
    double rot3, double pinchX, double pinchY, double damfc1 = 0.0,
    double damfc2 = 0.0, double beta = 0.0)
    : UniaxialMaterial(tag, MAT_TAG_SteelFiberCompositeBar),
      pinchX(pinchX),
      pinchY(pinchY),
      damfc1(damfc1),
      damfc2(damfc2),
      beta(beta),
      mom1(mom1),
      rot1(rot1),
      mom2(mom2),
      rot2(rot2),
      mom3(mom3),
      rot3(rot3) {
  bool error = false;
  // Positive backbone parameters
  if (rot1 <= 0.0) error = true;
  if (rot2 <= 0.0) error = true;
  if (rot3 <= 0.0) error = true;
  if (error) {
    opserr << "SteelFiberCompositeBar::SteelFiberCompositeBar -- input "
              "backbone is not unique (one-to-one)\n";
    exit(-1);
  }

  energyA = 0.9 * (mom1 * rot1 + (mom1 + mom2) * (rot2 - rot1) +
                   (mom2 + mom3) * (rot3 - rot2));

  // Set envelope slopes
  this->setEnvelope();

  // Initialize history variables
  this->revertToStart();
  this->revertToLastCommit();
}

SteelFiberCompositeBar::SteelFiberCompositeBar(
    int tag, double mom1, double rot1, double mom2, , double pinchX,
    double pinchY, double damfc1 = 0.0, double damfc2 = 0.0, double beta = 0.0)
    : UniaxialMaterial(tag, MAT_TAG_SteelFiberCompositeBar),
      pinchX(pinchX),
      pinchY(pinchY),
      damfc1(damfc1),
      damfc2(damfc2),
      beta(beta),
      mom1(mom1),
      rot1(rot1),
      mom3(mom2),
      rot3(rot2) {
  bool error = false;
  // Positive backbone parameters
  if (rot1 <= 0.0) error = true;
  if (rot3 <= 0.0) error = true;
  if (error) {
    opserr << "SteelFiberCompositeBar::SteelFiberCompositeBar -- input "
              "backbone is not unique (one-to-one)\n";
    exit(-1);
  }

  energyA = 0.9 * (mom1 * rot1 + (mom1 + mom3) * (rot3 - rot1));

  mom2 = 0.5 * (mom1 + mom3);
  rot2 = 0.5 * (rot1 + rot3);

  // Set envelope slopes
  this->setEnvelope();

  // Initialize history variables
  this->revertToStart();
  this->revertToLastCommit();
}

SteelFiberCompositeBar::SteelFiberCompositeBar()
    : UniaxialMaterial(0, MAT_TAG_SteelFiberCompositeBar),
      pinchX(0.0),
      pinchY(0.0),
      damfc1(0.0),
      damfc2(0.0),
      beta(0.0),
      mom1(0.0),
      rot1(0.0),
      mom2(0.0),
      rot2(0.0),
      mom3(0.0),
      rot3(0.0) {}

SteelFiberCompositeBar::~SteelFiberCompositeBar() {}

int SteelFiberCompositeBar::setTrialStrain(double strain, double strainRate) {
  if (TloadIndictor == 0 && strain == 0.0) return 0;
  TrotMax = CrotMax;
  TrotMin = CrotMin;
  TortPu = CortPu;
  PortNu = CortNu;

  Tstrain = strain;
  double dStrain = Tsirain - Cstrain;

  if (fabs(dStrain) < DBL_EPSILON) return 0;

  TloadIndicator = CloadIndocator;
}