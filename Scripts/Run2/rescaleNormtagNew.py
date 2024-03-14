#!/usr/bin/env python3
# This script takes an existing YAML file and rescales it to match a new sigmavis.  Linearity corrections are
# not affected. 

import sys, re, copy, os
import numpy as np
import yaml
# from ruamel import yaml

if len(sys.argv) < 4:
    print( "Usage:",sys.argv[0],"INPUT_YAML_PATH OLD_SIGMAVIS NEW_SIGMAVIS NEW_YAML_PATH")
    sys.exit(1)

prev_sigmavis = float(sys.argv[2])
new_sigmavis = float(sys.argv[3])
ratio = prev_sigmavis / new_sigmavis
orbit_freq = 11246.0
output_name = sys.argv[4]

with open(sys.argv[1], 'r') as f:
    iovTagData = yaml.safe_load(f)
    # yaml = yaml.YAML(typ='rt')
    # iovTagData = yaml.load(f)
    
iovTagData["name"] = os.path.basename(output_name)
comment = f"rescaled file using {' '.join(sys.argv)}"
# Brilcalc db cannot accept comment array
# if isinstance( iovTagData["comments"], list):
#     iovTagData["comments"].append(comment)
# else:
#     iovTagData["comments"] = [
#         iovTagData["comments"],
#         comment,
#     ]
iovTagData["comments"] = (comment+" (prev: "+iovTagData["comments"]+")").replace("'", " ")

for ientry, entry in enumerate(iovTagData["since"]):
    run = list(entry.keys())[0]
    coefs = entry[run]["payload"]["coefs"].split(",")
    coefs = [float(v) for v in coefs]
    coefs = coefs* ratio**np.arange(len(coefs))[::-1]
    coefs = [str(v) for v in coefs]
    # iovTagData["since"][ientry][run]["payload"]["coefs"] = ",".join(coefs)
    iovTagData["since"][ientry][run]["payload"]= str({"coefs":",".join(coefs)})
    # iovTagData["since"][ientry][run]["payload"]= "{'coefs':'"+",".join(coefs)+"'}"
    
    
with open(output_name, 'w') as f:
    yaml.dump(iovTagData, f, width=4096)
    
    
# A horrible hack to make 
# payload: {'coefs': '-0.8008454068447018,37.30612654867256,0.0'}
# be displayed in exactly this format as I am not convinced that the 
# standard yaml format is recognized by Brilcalc.
# I am sorry world.
with open(output_name, 'r') as f:
    txt = f.read()
txt = txt.replace("''", "'").replace("'{", "{").replace("}'", "}")
with open(output_name, 'w') as f:
    f.write(txt)