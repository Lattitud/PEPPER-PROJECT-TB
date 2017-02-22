<?xml version="1.0" encoding="UTF-8" ?>
<Package name="text-2" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="InvitationToGame" src="behavior_1/InvitationToGame/InvitationToGame.dlg" />
        <Dialog name="Replay" src="Replay/Replay.dlg" />
    </Dialogs>
    <Resources>
        <File name="style" src="html/css/style.css" />
        <File name="angry" src="html/images/angry.png" />
        <File name="happy" src="html/images/happy.png" />
        <File name="neutral" src="html/images/neutral.png" />
        <File name="sad" src="html/images/sad.png" />
        <File name="scare" src="html/images/scare.png" />
        <File name="surprise" src="html/images/surprise.png" />
        <File name="index" src="html/index.html" />
        <File name="emotions" src="html/images/emotions.png" />
        <File name="jquery-3.1.0.min" src="html/js/jquery-3.1.0.min.js" />
        <File name="script" src="html/js/script.js" />
        <File name="choice_sentences" src="behavior_1/Aldebaran/choice_sentences.xml" />
        <File name="imoticons" src="html/images/imoticons.png" />
        <File name="HEIG_LOGO" src="html/images/HEIG_LOGO.png" />
    </Resources>
    <Topics>
        <Topic name="InvitationToGame_enu" src="behavior_1/InvitationToGame/InvitationToGame_enu.top" topicName="InvitationToGame" language="en_US" />
        <Topic name="Replay_enu" src="Replay/Replay_enu.top" topicName="Replay" language="en_US" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
