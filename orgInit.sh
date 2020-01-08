#temp directory for working files
mkdir sfdx_temp

#create scratch org
sfdx force:org:create -s -f config/project-scratch-def.json -d 7 -s -w 60

#push source
sfdx force:source:push -f

#prep unique Username in User csv
sed "s/{TIMESTAMP}/$(date "+%Y%m%d%H%M%S")/g" data/core/User.csv > sfdx_temp/User_Load.csv

#load csvs into core objects
sfdx force:data:bulk:upsert -s UserRole -f data/core/UserRole.csv -i Name -w 2
sfdx force:data:bulk:upsert -s User -f sfdx_temp/User_Load.csv -i External_Id__c -w 2
sfdx force:data:bulk:upsert -s Account -f data/core/Account.csv -i External_Id__c -w 5
sfdx force:data:bulk:upsert -s Opportunity -f data/core/Opportunity.csv -i External_Id__c -w 5

#create min records for Sales Analytics
sfdx force:data:record:create -s Task -v "Subject='Call'"
sfdx force:data:record:create -s Event -v "Subject='Call' DurationInMinutes='1' ActivityDateTime='2019-01-01'"

#clean up
rm -rf sfdx_temp

sfdx force:user:password:generate

sfdx force:user:display

#open org
sfdx force:org:open -p /analytics/wave/wave.apexp#home