<?xml version="1.0" encoding="UTF-8" ?>
<Package name="Portes-ouvertes" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="." xar="behavior.xar" />
        <BehaviorDescription name="behavior" src="Dialogue/behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="Accueil" src="Dialogue/Accueil/Accueil.dlg" />
        <Dialog name="Accueil" src="behavior_1/Accueil/Accueil.dlg" />
        <Dialog name="Accueil" src="behavior_1/behavior_1/Accueil/Accueil.dlg" />
    </Dialogs>
    <Resources>
        <File name="" src="Dialogue/.metadata" />
        <File name="Dialogue" src="Dialogue/Dialogue.pml" />
        <File name="manifest" src="Dialogue/manifest.xml" />
    </Resources>
    <Topics>
        <Topic name="Accueil_enu" src="Dialogue/Accueil/Accueil_enu.top" topicName="Accueil" language="en_US" />
        <Topic name="Accueil_frf" src="Dialogue/Accueil/Accueil_frf.top" topicName="Accueil" language="fr_FR" />
        <Topic name="Accueil_enu" src="behavior_1/Accueil/Accueil_enu.top" topicName="Accueil" language="en_US" />
        <Topic name="Accueil_frf" src="behavior_1/Accueil/Accueil_frf.top" topicName="Accueil" language="fr_FR" />
        <Topic name="Accueil_enu" src="behavior_1/behavior_1/Accueil/Accueil_enu.top" topicName="Accueil" language="en_US" />
        <Topic name="Accueil_frf" src="behavior_1/behavior_1/Accueil/Accueil_frf.top" topicName="Accueil" language="fr_FR" />
    </Topics>
    <IgnoredPaths />
</Package>
