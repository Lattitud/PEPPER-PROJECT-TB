<?xml version="1.0" encoding="UTF-8" ?>
<Package name="version3" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="porte_ouvertes" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="continue" src="porte_ouvertes/continue/continue.dlg" />
        <Dialog name="presentation" src="porte_ouvertes/presentation/presentation.dlg" />
        <Dialog name="invitation" src="invitation/invitation.dlg" />
        <Dialog name="Replay" src="porte_ouvertes/behavior_1/Replay/Replay.dlg" />
        <Dialog name="welcome" src="welcome/welcome.dlg" />
        <Dialog name="presentSuisse" src="presentSuisse/presentSuisse.dlg" />
        <Dialog name="invitation" src="porte_ouvertes/invitation/invitation.dlg" />
        <Dialog name="Replay" src="porte_ouvertes/porte_ouvertes/behavior_1/Replay/Replay.dlg" />
    </Dialogs>
    <Resources>
        <File name="swiftswords_ext" src="porte_ouvertes/swiftswords_ext.mp3" />
        <File name="taichimove" src="porte_ouvertes/taichimove.pmt" />
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
        <Topic name="presentation_frf" src="porte_ouvertes/presentation/presentation_frf.top" topicName="presentation" language="fr_FR" />
        <Topic name="continue_frf" src="porte_ouvertes/continue/continue_frf.top" topicName="continue" language="fr_FR" />
        <Topic name="welcome_frf" src="welcome/welcome_frf.top" topicName="welcome" language="fr_FR" />
        <Topic name="invitation_frf" src="invitation/invitation_frf.top" topicName="invitation" language="fr_FR" />
        <Topic name="Replay_frf" src="porte_ouvertes/behavior_1/Replay/Replay_frf.top" topicName="Replay" language="fr_FR" />
        <Topic name="presentSuisse_frf" src="presentSuisse/presentSuisse_frf.top" topicName="presentSuisse" language="fr_FR" />
        <Topic name="invitation_frf" src="porte_ouvertes/invitation/invitation_frf.top" topicName="invitation" language="fr_FR" />
        <Topic name="Replay_frf" src="porte_ouvertes/porte_ouvertes/behavior_1/Replay/Replay_frf.top" topicName="Replay" language="fr_FR" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
