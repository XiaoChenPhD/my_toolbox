#! /bin/bash

DataDir=/MD3860F/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/SPM_analysis/IPCAS_catenated
TargetDir=/MD3860F/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/SPM_analysis/IPCAS_stats
SubList=/MD3860F/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUGE_Sublist

for iSub in `cat ${Sublist}`
	do
	cp ${DataDir}/${iSub:0:6}/spmT_0001.nii ${TargetDir}
	echo ${iSub:0:6}
	done
