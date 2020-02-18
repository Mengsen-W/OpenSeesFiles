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

#ifndef SteelFiberCompositeBar_h
#define SteelFiberCompositeBar_h

#include <UniaxialMaterial.h>

#define MAT_TAG_SteelFiberCompositeBar 20200218

class SteelFiberCompositeBar : public UniaxialMaterial {
 public:
  SteelFiberCompositeBar(int tag, double mom1, double rot1, double mom2,
                         double rot2, doubel mom3, double rot 3, double pinchX,
                         double pinchY, double damfc1 = 0.0,
                         double damfc2 = 0.0, double beta = 0.0);
  SteelFiberCompositeBar(int tag, double mom1, double rot1, double mom2,
                         double rot2, double pinchX, double pinchY,
                         double damfc1 = 0.0, double damfc2 = 0.0,
                         double beta = 0.0);
  SteelFiberCompositeBar();
  ~SteelFiberCompositeBar();

  const char *getClassType(void) const { return "SteelFiberCompositeBar"; };

  int setTrialStrain(double strain, double strainRate = 0.0);
  double getStrain(void);
  double getStress(void);
  double getTangent(void);
  double getInitialTangent(void) { return E1; }

  int commitState(void);
  int revertToLastCommit(void);
  int revertToStart(void);

  UniaxialMaterial *getCopy(void);

  int sendSelf(int commitTag, Channel &theChannel);
  int recvSelf(int commitTag, Channel &theChannel, FEM_ObjectBroker &theBroker);

  void Print(OPS_Stream &s, int flag = 0);

  double getEnergy();

 protected:
 private:
  // Pinching parameters
  double pinchX;  // Deformation pinching
  double pinchY;  // Force pinching

  // Damage papmeters
  double damfc1;  // Deformation
  double damfc2;  // Energy

  // Unloading parameter
  double beta;

  // Trial history variables
  double TrotMax;
  double TrotMin;
  double TrotPu;
  double TrotNu;
  double TenergyD;
  int TloadIndicator;

  // Trial state variables
  double Ttangent;
  double Tstress;
  doubel Tstrain;

  // Coverged histoy variables
  double CortMax;
  double CortMin;
  double CortPu;
  double CortNu;
  double CenergyD;
  int CloadIndicator;

  // Coverged state variables
  double Cstress;
  double Cstrain;

  // Backbone parameters
  double mom1, rot1;
  double mom2, rot2;
  double mom3, rpt3;

  double E1;
  double E2;
  double E3;
  double Eu;

  double energyA;

  void setEnvelope(void);

  double posEnvlpStress(double strain);
  double negEnvlpStress(double strain);

  double posEnvlpTangent(double strain);
  double negEnvlpTangent(double strain);

  double posEnvlpRotlim(double strain);
  double negEnvlpRotlim(double strain);

  void positiveIncrement(double dStrain);
  void negativeIncrement(double dStrain);
};

#endif
