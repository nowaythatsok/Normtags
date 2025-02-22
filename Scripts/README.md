This directory contains various scripts for working with normtags.

* checkJSONSyntax.py: A very simple script which checks to make sure that the input file (or files) contain valid JSON. Use this if you need to manually edit a JSON file to make sure you didn't miss a comma or close-brace or otherwise introduce a problem.

* combineYears.py: A script to combine the luminosity uncertainties from multiple years. The table of uncertainties and correlations should be specified in a text file; see the script for details of the format of this file. Use -y to select just some years, -c to force all uncertainties to be treated as correlated, or -u to force all uncertainties to be treated as uncorrelated.

* compareBXPatterns.py: A script which compares the per-BX data for two luminometers (hfoc/hfet and pltzero) to look for any shifts in the BX data between the two.

* getNBX.py: A script which takes a list of fills and gets the number of colliding bunches for those fills, comparing WBM data, beam data, and luminometer data. See the script itself for further documentation and the NBX/ directory for more information about the results of this script. NBX_perFill_2015.csv, NBX_perFill_2016.csv, and NBX_perFill_2017.csv contain this data for 2015, 2016, and 2017 fills.

* getYearLS.py: For a given year, checks the online and normtag luminosity results against each other and against the DCSOnly JSON to look for missing lumisections, and produces an output JSON file of the lumisections present for the year.

* intersectJSONNormtag.py: A script that takes an input JSON file (first argument) and input normtag (second argument) and produces an output JSON file containing the intersection of the two. It can be run repeatedly to get the intersection with respect to multiple normtags.

* makeCompositeNT.py: A script that takes a set of input normtags and will build an overall normtag using the priority order specified (basically similar to how doFillValidation.py works but allowing you to change the order after the fact). Run with -h to see the options.

* makeDTNormtag.py: A script that makes the 2018 DT normtag. This is necessary because the DT calibration includes a constant term but this is applied in brilcalc as a per-bunch correction so it needs to be adjusted for the number of bunches (which is read in from the fill information CSV file).

* makeLeaderboard.py: A very silly script that makes a leaderboard of who's done the fill validation the most.

* makeValidationSummary.py: A script that makes a plot summarizing the results of the validation by showing the total fraction of lumisections that are good for all luminometers, bad for one specific luminometer, or bad for more than one luminometer.

* makeJSONFromNormtag.py: A script that takes an normtag and makes a JSON file containing the list of lumisections that the normtag covers.

* normtagComposition.py: A script that takes a composite normtag and tells you the fraction of that normtag provided by each luminometer in the normtag.

* summarizeCalibration.py: Given a detector calibration contained in a yaml file, will summarize the sigmavis, efficiency, and linearity corrections that go into this tag.

* validateInputFile.py: A script to validate input data intended for loading into the lumi DB. It checks to make sure that all lines are well-formed, that there are no NaN or Inf values, and that the sum of the BX luminosity agrees (reasonably well) with the total luminosity.

* validateNormtag.sh: A very simple script which validates normtag_BRIL.json (or whatever other normtag you specify in the argument) by checking to make sure it produces proper output using the 2018 DCSOnly json.

* compareTwoCSVsFromBRILCALC.py: Get output per BX from brilcalc using normtag filters. Probably best in bash script as follows:

```bash
for nt in normtag_hfet.json normtag_dt.json normtag_pltzero.json;
  do
    brilcalc lumi --normtag=${nt} -i /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/PromptReco/Cert_294927-306126_13TeV_PromptReco_Collisions17_JSON_MuonPhys.txt -u 'hz/ub' -o ${nt}.csv --output-style=csv --byls --tssec
  done

python Scripts/compareTwoCSVsFromBRILCALC.py normtag_hfet.json.csv normtag_pltzero.json.csv Scripts/NBX_perFill_2017.csv HFPLTFILTER
```
