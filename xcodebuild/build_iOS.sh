projectPath=/Users/liuzhimin/Dropbox/Personal?Code/FSMeeting
thearchviePath=/Users/liuzhimin/Desktop/CloudMeeting.xcarchive
ipaPath=/Users/liuzhimin/Desktop/
projectname=FSMeetingClient
ipaName=CloudMeeting
resourcefolder=res_fs_zx
provisionfile=CloudMeeting_dev

cd $projectPath

######copy file######
echo "***************** copy public file start *****************"

cp -rf ./$resourcefolder/AppIcon.appiconset ./FSMeetingClient/Images.xcassets
cp -rf ./$resourcefolder/InfoPlist.strings/*.lproj ./FSMeetingClient/
cp -rf ./$resourcefolder/Localizable.strings/*.lproj ./Resources/
cp -rf ./$resourcefolder/config.xml  ./FSMeetingClient/config.xml
cp -rf ./$resourcefolder/Multiversion  ./FSMeetingClient/Images.xcassets
cp -rf ./$resourcefolder/FSMeetingClient-Info.plist  ./FSMeetingClient/FSMeetingClient-Info.plist
cp -rf ./$resourcefolder/Macro.h  ./FSMeetingClient/Macro/Macro.h

echo "***************** copy over *****************"


######start bulild######
echo "***************** start clean workspace *****************"

xcodebuild clean

echo "*****************clean workspace over *****************"

echo "*****************start build workspace *****************"

xcodebuild -workspace $projectname.xcworkspace -scheme $projectname -configuration Release

echo "*****************build workspace over *****************"

echo "*****************start export archive *****************"

xcodebuild -workspace $projectname.xcworkspace -scheme $projectname archive -archivePath $thearchviePath

echo "***************** export archive over *****************"

echo "*****************start export ipa *****************"

xcodebuild -exportArchive -exportFormat ipa -archivePath $thearchviePath -exportProvisioningProfile $provisionfile -exportPath $ipaPath/$ipaName.ipa

echo "***************** export ipa over *****************"
