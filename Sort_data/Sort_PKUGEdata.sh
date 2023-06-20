#! /bin/sh
# to sort PKUGE's MRI data in the rumination project
# sort resting state

#Written by ChenXiao 20180705

workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/MRI_data
targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUGE_rest

T1dir=${targetdir}/T1Raw
Functiondir=${targetdir}/FunRaw
mkdir ${T1dir}
mkdir ${Functiondir}


Sublist=/MD3860F/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUGE_Sublist
#i=0

for iSub in `cat ${Sublist}`
	do
	#let i=i+1
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_t1iso_fspgr/* ${T1dir}/${iSub:0:6}
	
	done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_bold_bw_rest/* ${Functiondir}/${iSub:0:6}
	done

# sort task state
workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/MRI_data
targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUGE_task
T1dir=${targetdir}/T1Raw
Functiondir1=${targetdir}/FunRaw  #HappyMemo
Functiondir2=${targetdir}/S2_FunRaw  #SadMemo
Functiondir3=${targetdir}/S3_FunRaw  #Rumination
Functiondir4=${targetdir}/S4_FunRaw  #Distraction
mkdir ${T1dir}
mkdir ${Functiondir1}
mkdir ${Functiondir2}
mkdir ${Functiondir3}
mkdir ${Functiondir4}

Sublist=/MD3860F/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUGE_Sublist

for iSub in `cat ${Sublist}`
	do
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_t1iso_fspgr/* ${T1dir}/${iSub:0:6}
	echo ${iSub:0:6}
done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir1}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_bold_bw_happy/* ${Functiondir1}/${iSub:0:6}
	
	mkdir ${Functiondir2}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_bold_bw_sad/* ${Functiondir2}/${iSub:0:6}
	
	mkdir ${Functiondir3}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_bold_bw_rum/* ${Functiondir3}/${iSub:0:6}

	mkdir ${Functiondir4}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/Sorted/*/*-ABI1_bold_bw_dis/* ${Functiondir4}/${iSub:0:6}
done

