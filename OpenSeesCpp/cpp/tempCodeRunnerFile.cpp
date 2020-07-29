SP_Constraint *sp1 = new SP_Constraint(1, 1, 0, 0.0);
  // SP_Constraint *sp2 = new SP_Constraint(2, 1, 1, 0.0);
  // SP_Constraint *sp3 = new SP_Constraint(3, 2, 0, 0.0);
  // SP_Constraint *sp4 = new SP_Constraint(4, 2, 1, 0.0);
  // SP_Constraint *sp5 = new SP_Constraint(5, 3, 0, 0.0);
  // SP_Constraint *sp6 = new SP_Constraint(6, 3, 1, 0.0);
  // theDomain->addSP_Constraint(sp1);
  // theDomain->addSP_Constraint(sp2);
  // theDomain->addSP_Constraint(sp3);
  // theDomain->addSP_Constraint(sp4);
  // theDomain->addSP_Constraint(sp5);
  // theDomain->addSP_Constraint(sp6);

  // // construct a linear time series object using constructor:
  // //		LinearSeries()

  // TimeSeries *theSeries = new LinearSeries();

  // // construct a load pattren using constructor:
  // //		LoadPattern(tag)
  // // and then set it's TimeSeries and add it to the domain

  // LoadPattern *theLoadPattern = new LoadPattern(1);
  // theLoadPattern->setTimeSeries(theSeries);
  // theDomain->addLoadPattern(theLoadPattern);

  // // construct a nodal load using constructor:
  // //		NodalLoad(tag, nodeID, Vector &)
  // // first construct a Vector of size 2 and set the values NOTE C INDEXING
  // // then construct the load and add it to the domain

  // Vector theLoadValues(2);
  // theLoadValues(0) = 100.0;
  // theLoadValues(1) = -50.0;
  // NodalLoad *theLoad = new NodalLoad(1, 4, theLoadValues);
  // theDomain->addNodalLoad(theLoad, 1);

  // // create an Analysis object to perform a static analysis of the model
  // //  - constructs:
  // //    AnalysisModel of type AnalysisModel,
  // //	  EquiSolnAlgo of type Linear
  // //	  StaticIntegrator of type LoadControl
  // //	  ConstraintHandler of type Penalty
  // //    DOF_Numberer which uses RCM
  // //    LinearSOE of type Band SPD
  // // and then the StaticAnalysis object

  // AnalysisModel *theModel = new AnalysisModel();
  // EquiSolnAlgo *theSolnAlgo = new Linear();
  // StaticIntegrator *theIntegrator = new LoadControl(1.0, 1, 1.0, 1.0);
  // ConstraintHandler *theHandler = new PenaltyConstraintHandler(1.0e8, 1.0e8);
  // RCM *theRCM = new RCM();
  // DOF_Numberer *theNumberer = new DOF_Numberer(*theRCM);
  // BandSPDLinSolver *theSolver = new BandSPDLinLapackSolver();
  // LinearSOE *theSOE = new BandSPDLinSOE(*theSolver);

  // StaticAnalysis theAnalysis(*theDomain, *theHandler, *theNumberer,
  // *theModel,
  //                            *theSolnAlgo, *theSOE, *theIntegrator);

  // // perform the analysis & print out the results for the domain
  // int numSteps = 1;
  // theAnalysis.analyze(numSteps);