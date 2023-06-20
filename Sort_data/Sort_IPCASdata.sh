#! /bin/sh
# to sort IPCAS's MRI data in the rumination project


#Written by ChenXiao 20180709

# First copy Raw dat to unsorted data

Workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/MRI_data
Targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_unsorted

Sublist=/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/IPCAS_Sublist

for iSub in `cat ${Sublist}`
	do
	mkdir ${Targetdir}/${iSub:0:6}
	cp -r ${Workdir}/${iSub}/* ${Targetdir}/${iSub:0:6}
	done

#After sorting with dicom sorter in dpabi and change the path names, copy sorted dicom images to IPCAS_sorted

#Copying Resting-state data

Workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_sorted
Targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_rest

T1dir=${Targetdir}/T1Raw
Functiondir=${Targetdir}/FunRaw
mkdir ${T1dir}
mkdir ${Functiondir}

Sublist=/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/IPCAS_Sublist


for iSub in `cat ${Sublist}`
	do
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*t1iso*/* ${T1dir}/${iSub:0:6}
	done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*rest/* ${Functiondir}/${iSub:0:6}
	done

#Copying task-state data
Workdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_sorted
Targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_task
T1dir=${Targetdir}/T1Raw
Functiondir1=${Targetdir}/FunRaw  #HappyMemo
Functiondir2=${Targetdir}/S2_FunRaw  #SadMemo
Functiondir3=${Targetdir}/S3_FunRaw  #Rumination
Functiondir4=${Targetdir}/S4_FunRaw  #Distraction
mkdir ${T1dir}
mkdir ${Functiondir1}
mkdir ${Functiondir2}
mkdir ${Functiondir3}
mkdir ${Functiondir4}

Sublist=/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/IPCAS_Sublist

for iSub in `cat ${Sublist}`
	do
	mkdir ${T1dir}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*t1iso*/* ${T1dir}/${iSub:0:6}
	echo ${iSub:0:6}T1done
	done

for iSub in `cat ${Sublist}`
	do
	mkdir ${Functiondir1}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*happy*/* ${Functiondir1}/${iSub:0:6}
	
	mkdir ${Functiondir2}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*sad*/* ${Functiondir2}/${iSub:0:6}
	
	mkdir ${Functiondir3}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*rum*/* ${Functiondir3}/${iSub:0:6}

	mkdir ${Functiondir4}/${iSub:0:6}
	cp -r ${Workdir}/*${iSub:1:5}*/*dis*/* ${Functiondir4}/${iSub:0:6}
	
	echo ${iSub:0:6}Funcdone
done

