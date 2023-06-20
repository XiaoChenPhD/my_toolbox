#! /bin/bash
# To sort regional metrics in the file structure the dpbabi GUI require
# Written by ChenXiao 20180930

Datadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing
Targetdir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Analysis/Regional_Metrics/GUI_work_GSR/PKUSIMENS
mkdir ${Targetdir}
Restdatadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUSIMENS_rest
Taskdatadir=/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/PKUSIMENS_task

Restdir=${Targetdir}/rest
Happydir=${Targetdir}/happy
Saddir=${Targetdir}/sad
Rumdir=${Targetdir}/rum
Disdir=${Targetdir}/dis
mkdir ${Restdir}
mkdir ${Happydir}
mkdir ${Saddir}
mkdir ${Rumdir}
mkdir ${Disdir}

mkdir ${Restdir}/ALFF
cp ${Restdatadir}/ResultsS/ALFF_FunImgARglobalCW/sz* ${Restdir}/ALFF
mkdir ${Restdir}/DC
cp ${Restdatadir}/ResultsS/DegreeCentrality_FunImgARglobalCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Restdir}/DC
mkdir ${Restdir}/fALFF
cp ${Restdatadir}/ResultsS/fALFF_FunImgARglobalCW/sz* ${Restdir}/fALFF
mkdir ${Restdir}/ReHo
cp ${Restdatadir}/ResultsS/ReHo_FunImgARglobalCWF/sz* ${Restdir}/ReHo
mkdir ${Restdir}/VMHC
cp ${Restdatadir}/ResultsS/VMHC_FunImgARglobalCWFsymS/sz* ${Restdir}/VMHC

mkdir ${Happydir}/ALFF
cp ${Taskdatadir}/ResultsS/ALFF_FunImgARglobalCW/sz* ${Happydir}/ALFF
mkdir ${Happydir}/DC
cp ${Taskdatadir}/ResultsS/DegreeCentrality_FunImgARglobalCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Happydir}/DC
mkdir ${Happydir}/fALFF
cp ${Taskdatadir}/ResultsS/fALFF_FunImgARglobalCW/sz* ${Happydir}/fALFF
mkdir ${Happydir}/ReHo
cp ${Taskdatadir}/ResultsS/ReHo_FunImgARglobalCWF/sz* ${Happydir}/ReHo
mkdir ${Happydir}/VMHC
cp ${Taskdatadir}/ResultsS/VMHC_FunImgARglobalCWFsymS/sz* ${Happydir}/VMHC

mkdir ${Saddir}/ALFF
cp ${Taskdatadir}/S2_ResultsS/ALFF_FunImgARglobalCW/sz* ${Saddir}/ALFF
mkdir ${Saddir}/DC
cp ${Taskdatadir}/S2_ResultsS/DegreeCentrality_FunImgARglobalCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Saddir}/DC
mkdir ${Saddir}/fALFF
cp ${Taskdatadir}/S2_ResultsS/fALFF_FunImgARglobalCW/sz* ${Saddir}/fALFF
mkdir ${Saddir}/ReHo
cp ${Taskdatadir}/S2_ResultsS/ReHo_FunImgARglobalCWF/sz* ${Saddir}/ReHo
mkdir ${Saddir}/VMHC
cp ${Taskdatadir}/S2_ResultsS/VMHC_FunImgARglobalCWFsymS/sz* ${Saddir}/VMHC

mkdir ${Rumdir}/ALFF
cp ${Taskdatadir}/S3_ResultsS/ALFF_FunImgARglobalCW/sz* ${Rumdir}/ALFF
mkdir ${Rumdir}/DC
cp ${Taskdatadir}/S3_ResultsS/DegreeCentrality_FunImgARglobalCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Rumdir}/DC
mkdir ${Rumdir}/fALFF
cp ${Taskdatadir}/S3_ResultsS/fALFF_FunImgARglobalCW/sz* ${Rumdir}/fALFF
mkdir ${Rumdir}/ReHo
cp ${Taskdatadir}/S3_ResultsS/ReHo_FunImgARglobalCWF/sz* ${Rumdir}/ReHo
mkdir ${Rumdir}/VMHC
cp ${Taskdatadir}/S3_ResultsS/VMHC_FunImgARglobalCWFsymS/sz* ${Rumdir}/VMHC

mkdir ${Disdir}/ALFF
cp ${Taskdatadir}/S4_ResultsS/ALFF_FunImgARglobalCW/sz* ${Disdir}/ALFF
mkdir ${Disdir}/DC
cp ${Taskdatadir}/S4_ResultsS/DegreeCentrality_FunImgARglobalCWF/szDegreeCentrality_PositiveWeightedSumBrainMap* ${Disdir}/DC
mkdir ${Disdir}/fALFF
cp ${Taskdatadir}/S4_ResultsS/fALFF_FunImgARglobalCW/sz* ${Disdir}/fALFF
mkdir ${Disdir}/ReHo
cp ${Taskdatadir}/S4_ResultsS/ReHo_FunImgARglobalCWF/sz* ${Disdir}/ReHo
mkdir ${Disdir}/VMHC
cp ${Taskdatadir}/S4_ResultsS/VMHC_FunImgARglobalCWFsymS/sz* ${Disdir}/VMHC
