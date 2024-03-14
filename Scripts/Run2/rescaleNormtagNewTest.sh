# 2017
python3 rescaleNormtagNew.py yaml/pltzero17v24.yaml 297.7  293.8  new/pltzero17_run2_legacy_v1.yaml
python3 rescaleNormtagNew.py yaml/bcm1f17v7.yaml    224.7  222.4  new/bcm1f17_run2_legacy_v1.yaml
python3 rescaleNormtagNew.py yaml/hfoc17v11.yaml    841.3  830.4  new/hfoc17_run2_legacy_v1.yaml # no eff, lin corrections whatsoever
python3 rescaleNormtagNew.py yaml/hfet17v11.yaml    2630.0 2601.2 new/hfet17_run2_legacy_v1.yaml
# python rescaleNormtagNew.py yaml/pcc17v8.yaml 4636304 6016 # done alreadly
# 2018
python3 rescaleNormtagNew.py yaml/pltzero18PAS.yaml 261.6  261.6  new/pltzero18_run2_legacy_v1.yaml # this is the same number we had previously
python3 rescaleNormtagNew.py yaml/bcm1f18PAS.yaml   198.24 210.0  new/bcm1f18_run2_legacy_v1.yaml
python3 rescaleNormtagNew.py yaml/hfoc18PAS.yaml    805.9  802.3  new/hfoc18_run2_legacy_v1.yaml 
python3 rescaleNormtagNew.py yaml/hfet18PAS.yaml    2503.6 2500.0 new/hfet18_run2_legacy_v1.yaml
# python3 rescaleNormtagNew.py yaml/pcc18PAS.yaml    xxx 962790 new/pcc18_run2_legacy_v1.yaml # this needs a new normtag as it is completely reprocessed


# scp new/*.yaml brildev1:/brildata/db/
# export PATH=$HOME/.local/bin:/cvmfs/cms-bril.cern.ch/brilconda3/bin:$PATH

# briltag insertiov -c onlinew -p /brildata/db/db.ini -y pltzero17_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y bcm1f17_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y hfoc17_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y hfet17_run2_legacy_v1.yaml

# # briltag insertiov -c onlinew -p /brildata/db/db.ini -y pltzero18_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y bcm1f18_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y hfoc18_run2_legacy_v1.yaml
# briltag insertiov -c onlinew -p /brildata/db/db.ini -y hfet18_run2_legacy_v1.yaml
