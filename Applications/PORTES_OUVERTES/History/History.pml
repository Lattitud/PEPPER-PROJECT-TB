<?xml version="1.0" encoding="UTF-8" ?>
<Package name="History" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="portes_ouverts" src="portes_ouverts/portes_ouverts.dlg" />
        <Dialog name="continue" src="behavior_1/continue/continue.dlg" />
        <Dialog name="presentation" src="behavior_1/presentation/presentation.dlg" />
        <Dialog name="continue" src="behavior_1/porte_ouvertes/continue/continue.dlg" />
        <Dialog name="presentation" src="behavior_1/porte_ouvertes/presentation/presentation.dlg" />
    </Dialogs>
    <Resources />
    <Topics>
        <Topic name="portes_ouverts_frf" src="portes_ouverts/portes_ouverts_frf.top" topicName="portes_ouverts" language="fr_FR" />
        <Topic name="continue_enu" src="behavior_1/continue/continue_enu.top" topicName="continue" language="en_US" />
        <Topic name="presentation_enu" src="behavior_1/presentation/presentation_enu.top" topicName="presentation" language="en_US" />
        <Topic name="continue_frf" src="behavior_1/porte_ouvertes/continue/continue_frf.top" topicName="continue" language="fr_FR" />
        <Topic name="presentation_frf" src="behavior_1/porte_ouvertes/presentation/presentation_frf.top" topicName="presentation" language="fr_FR" />
    </Topics>
    <IgnoredPaths>
        <Path src=".metadata" />
    </IgnoredPaths>
</Package>
