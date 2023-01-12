<script>
    var rekData = {
        mainMenuData: [],
        dataDrugs: [],
        dataAdvice: [],
        dataResources: [],
        dataNews: [],
        hbsDrugs: '',
        hbsAdvice: '',
        hbsResources: '',
        properties: {
            environment: '${activeEnvironment}',
            companyId: ${liferayCompanyId},
            drugsStructureId: ${liferayDrugsStructureId},
            adviceStructureId: ${liferayAdviceStructureId},
            resourcesStructureId: ${liferayResourcesStructureId},
            newsStructureId: ${liferayNewsStructureId},
            groupName: '${liferayGroupName}',
            locale: 'sv_SE',
            secondsCacheData: 3600, //3600 == 1h.
            rekVersion: 2
        }
    };
</script>
