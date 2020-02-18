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

#include <stdlib.h>
#include <SteelFiberCompositeBar.h>
#include <OPS_Globals.h>
#include <math.h>
#include <float.h>
#include <Channel.h>

include <elementAPI.h>

void *
OPS_SteelFiberCompositeBar(void){
  // Pointer to a uniaxial material that will be return
  UniaxialMaterial *theMaterial = 0;

  int numArgs = OPS_GetNumRemainingInputArgs();
  if(numArgs != 1)
}