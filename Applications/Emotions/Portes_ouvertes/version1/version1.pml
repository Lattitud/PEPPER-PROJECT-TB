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
    </Dialogs>
    <Resources>
        <File name="swiftswords_ext" src="behavior_1/swiftswords_ext.mp3" />
        <File name="taichimove" src="behavior_1/taichimove.pmt" />
    </Resources>
    <Topics>
        <Topic name="continue_enu" src="behavior_1/continue/continue_enu.top" topicName="continue" language="en_US" />
        <Topic name="presentation_enu" src="behavior_1/presentation/presentation_enu.top" topicName="presentation" language="en_US" />
        <Topic name="invitation_enu" src="invitation/invitation_enu.top" topicName="invitation" language="en_US" />
        <Topic name="Replay_enu" src="behavior_1/behavior_1/Replay/Replay_enu.top" topicName="Replay" language="en_US" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
