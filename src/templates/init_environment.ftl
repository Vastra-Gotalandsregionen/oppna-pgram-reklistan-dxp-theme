<#-- Environments
    localEA
    test
    stage
    prod
-->

<#assign activeEnvironment = "prod" />
<#assign rekBuildTicker = "197" />

<#assign liferayCompanyId = 0 />
<#assign liferayDrugsStructureId = 0 />
<#assign liferayAdviceStructureId = 0 />
<#assign liferayResourcesStructureId = 0 />
<#assign liferayNewsStructureId = 0 />
<#assign liferayGroupName = "" />

<#assign includeDummyLinkList = false />

<#if activeEnvironment == "localEA">
    <#assign liferayCompanyId = 20101 />
    <#assign liferayDrugsStructureId = 36168 />
    <#assign liferayAdviceStructureId = 36172 />
    <#assign liferayResourcesStructureId = 36176 />
    <#assign liferayNewsStructureId = 36180 />
    <#assign liferayGroupName = "Guest" />
    <#assign includeDummyLinkList = true />
<#elseif activeEnvironment == "test">
    <#assign liferayCompanyId = 1712101 />
    <#assign liferayDrugsStructureId = 1715233 />
    <#assign liferayAdviceStructureId = 1715235 />
    <#assign liferayResourcesStructureId = 1715238 />
    <#assign liferayNewsStructureId = 2080202 />
    <#assign liferayGroupName = "Guest" />
<#elseif activeEnvironment == "stage">
    <#assign liferayCompanyId = 1712101 />
    <#assign liferayDrugsStructureId = 1715233 />
    <#assign liferayAdviceStructureId = 1715235 />
    <#assign liferayResourcesStructureId = 1715238 />
    <#assign liferayNewsStructureId = 2080202 />
    <#assign liferayGroupName = "Guest" />
<#elseif activeEnvironment == "prod">
    <#assign liferayCompanyId = 1712101 />
    <#assign liferayDrugsStructureId = 1715233 />
    <#assign liferayAdviceStructureId = 1715235 />
    <#assign liferayResourcesStructureId = 1715238 />
    <#assign liferayNewsStructureId = 2080202 />
    <#assign liferayGroupName = "Guest" />
</#if>
