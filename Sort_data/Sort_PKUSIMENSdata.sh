#! /bin/sh
# to sort PKUSIMENS's MRI #Written by ChenXiao 20180705data in the rumination project


# sort resting state

workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/MRI_data
targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUSIMENS_rest

T1dir=${targetdir}/T1Raw
Functiondir=${targetdir}/FunRaw
mkdir ${T1dir}
mkdir ${Functiondir}

Sublist=/MD3860F/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUSIMENS_Sublist

for iSub in `cat ${Sublist}`
	do
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*-ABI1_t1iso_mprage/* ${T1dir}/${iSub:0:6}
	done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*-sms_bold_2mm_rest/* ${Functiondir}/${iSub:0:6}
	done

#sort task state

workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/MRI_data
targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUSIMENS_task
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




for iSub in `cat ${Sublist}`
	do
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*-ABI1_t1iso_mprage/* ${T1dir}/${iSub:0:6}

	echo ${iSub:0:6}
	done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir1}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*happy/* ${Functiondir1}/${iSub:0:6}
	
	mkdir ${Functiondir2}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*sad/* ${Functiondir2}/${iSub:0:6}
	
	mkdir ${Functiondir3}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*rum/* ${Functiondir3}/${iSub:0:6}

	mkdir ${Functiondir4}/${iSub:0:6}
	cp -r ${workdir}/${iSub}/*dis/* ${Functiondir4}/${iSub:0:6}

	echo ${iSub:0:6}
done


