#---------------------------------------------------------
#΢�Ź��ںţ��ṹ���а�
#���ں�΢�źţ�Wilson_Struct
#---------------------------------------------------------

#Ddelta��Displacement increment of each cyclic loading. ��ÿ�ε����������ص�λ��������
#Dnum��Number of cyclic loading times. �������������ش�����
#Dincr��Displacement increment in each step.����������λ��������
#Node��Node which applied displacment. ��ʩ��λ�ƵĽڵ㣩
#dof��Direction of cyclic loading. ��ʩ��λ�Ƶķ���

proc Cyclic_Proc { Ddelta Dnum Dincr Node dof tol iter } {
	constraints Transformation
	numberer RCM
	#system UmfPack
	system BandGeneral;
	test NormDispIncr $tol $iter
	#algorithm NewtonLineSearch 
	algorithm KrylovNewton;	
	analysis Static
	for {set ii 1} {$ii <=$Dnum} {incr ii} {
		set u [expr $Ddelta*$ii]
		set negdel [expr $Dincr * -1]
		integrator DisplacementControl $Node $dof $Dincr;
		Analysis_Proc [expr int($u/$Dincr)]
		integrator DisplacementControl $Node $dof $negdel;
		Analysis_Proc [expr int(2*$u/$Dincr)]
		integrator DisplacementControl $Node $dof $Dincr;
		Analysis_Proc [expr int($u/$Dincr)]
	}
}

#Ĭ��Newton �� Newton -initila �� Broyden �� NewtonWithLineSearch
#Num����������
proc Analysis_Proc { Num } {
	for {set step 1} {$step <=$Num} {incr step} {
		#��ʼΪNewton�������ߣ�
		algorithm Newton -initial
		set ok [analyze 1]
		#����ʧ�ܣ�����ʹ��Broyden
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 300
			set ok [analyze 1]
			algorithm Newton
		}
		#����ʧ�ܣ�����ʹ��NewtonWithLineSearch
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch 0.8
			set ok [analyze 1]
			algorithm Newton
		}
		if {$ok != 0} {
			puts "Convergence Failure!"
		}
	}
}

proc Gravity_Proc { step } {
	set incr [expr 1./$step]	
	constraints Transformation
	numberer RCM
	system UmfPack
	test EnergyIncr 1.0e-6 200
	integrator LoadControl $incr
	algorithm Newton
	analysis Static
	analyze $step
	puts "Gravity Done."
	loadConst -time 0.0
}




