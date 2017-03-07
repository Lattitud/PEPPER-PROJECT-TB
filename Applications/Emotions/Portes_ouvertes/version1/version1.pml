<?xml version="1.0" encoding="UTF-8" ?>
<Package name="version1" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="continue" src="behavior_1/continue/continue.dlg" />
        <Dialog name="presentation" src="behavior_1/presentation/presentation.dlg" />
        <Dialog name="invitation" src="invitation/invitation.dlg" />
        <Dialog name="Replay" src="behavior_1/behavior_1/Replay/Replay.dlg" />
        <Dialog name="welcome" src="welcome/welcome.dlg" />
    </Dialogs>
    <Resources>
        <File name="swiftswords_ext" src="behavior_1/swiftswords_ext.mp3" />
        <File name="taichimove" src="behavior_1/taichimove.pmt" />
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
        <Topic name="presentation_frf" src="behavior_1/presentation/presentation_frf.top" topicName="presentation" language="fr_FR" />
        <Topic name="continue_frf" src="behavior_1/continue/continue_frf.top" topicName="continue" language="fr_FR" />
        <Topic name="welcome_enu" src="welcome/welcome_enu.top" topicName="welcome" language="en_US" />
        <Topic name="welcome_frf" src="welcome/welcome_frf.top" topicName="welcome" language="fr_FR" />
        <Topic name="invitation_frf" src="invitation/invitation_frf.top" topicName="invitation" language="fr_FR" />
        <Topic name="Replay_frf" src="behavior_1/behavior_1/Replay/Replay_frf.top" topicName="Replay" language="fr_FR" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
