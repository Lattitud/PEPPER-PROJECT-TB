<?xml version="1.0" encoding="UTF-8" ?>
<Package name="SmileyGame" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="SmileyGame" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="invitation" src="SmileyGame/invitation/invitation.dlg" />
        <Dialog name="Replay" src="SmileyGame/porte_ouvertes/behavior_1/Replay/Replay.dlg" />
    </Dialogs>
    <Resources>
        <File name="style" src="html/css/style.css" />
        <File name="HEIG_LOGO" src="html/images/HEIG_LOGO.png" />
        <File name="angry" src="html/images/angry.png" />
        <File name="emotions" src="html/images/emotions.png" />
        <File name="happy" src="html/images/happy.png" />
        <File name="imoticons" src="html/images/imoticons.png" />
        <File name="neutral" src="html/images/neutral.png" />
        <File name="sad" src="html/images/sad.png" />
        <File name="scare" src="html/images/scare.png" />
        <File name="surprise" src="html/images/surprise.png" />
        <File name="index" src="html/index.html" />
        <File name="jquery-3.1.0.min" src="html/js/jquery-3.1.0.min.js" />
        <File name="script" src="html/js/script.js" />
    </Resources>
    <Topics>
        <Topic name="invitation_frf" src="SmileyGame/invitation/invitation_frf.top" topicName="invitation" language="fr_FR" />
        <Topic name="Replay_frf" src="SmileyGame/porte_ouvertes/behavior_1/Replay/Replay_frf.top" topicName="Replay" language="fr_FR" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
