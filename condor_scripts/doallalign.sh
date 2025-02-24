#!/bin/bash

FROMPLATE=57
TOPLATE=50

echo "Set up SND environment"
SNDBUILD_DIR=/afs/cern.ch/user/s/snd2cern/public/SNDBUILD/sw
source /cvmfs/sndlhc.cern.ch/SNDLHC-2023/Jan22/setUp.sh
eval `alienv load -w $SNDBUILD_DIR --no-refresh sndsw/latest`
source /afs/cern.ch/user/s/snd2cern/public/fedra/setup_new.sh	

echo  "go into reconstruction folder "
cd /eos/experiment/sndlhc/emulsionData/2022/CERN/emu_reco/RUN1/b000041/

echo "do alignment"

source firstalign.sh $FROMPLATE $TOPLATE

source secondalign.sh $FROMPLATE $TOPLATE

source localalign.sh $FROMPLATE $TOPLATE
