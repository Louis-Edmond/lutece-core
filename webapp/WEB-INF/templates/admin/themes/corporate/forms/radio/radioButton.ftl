<#--
Macro: radioButton

Description: Generates an HTML radio button element with a specified name, ID, label, orientation, value, tabindex, title, disabled, readonly, checked, parameters, and mandatory flag.

Parameters:
- name (string, required): the name for the radio button element.
- id (string, optional): the ID for the radio button element.
- labelKey (string, optional): the label for the radio button element.
- labelFor (string, optional): the "for" attribute for the radio button's label element.
- orientation (string, optional): the orientation for the radio button element, either "vertical" (default) or "inline".
- value (string, optional): the value for the radio button element.
- tabIndex (string, optional): the tabindex for the radio button element.
- title (string, optional): the title for the radio button element.
- disabled (boolean, optional): whether the radio button element is disabled.
- readonly (boolean, optional): whether the radio button element is readonly.
- checked (boolean, optional): whether the radio button element is checked.
- params (string, optional): additional parameters to add to the HTML code.
- mandatory (boolean, optional): whether the radio button element is mandatory.
- propagateMandatory (boolean, optional): whether to propagate the mandatory flag to the radio button element.
-->
<#macro radioButton name id='' labelKey='' labelFor='' orientation='vertical' value='' tabIndex='' title='' disabled=false readonly=false checked=false params='' mandatory=false >
<#if propagateMandatory?? && propagateMandatory ><#local mandatory = true /></#if>
<#if orientation='vertical'><div class="radio">	</#if>
<label  class="form-check<#if orientation!='vertical'> form-check-inline</#if>" for="${labelFor}">
<input class="form-check-input" type="radio" id="${id}" name="${name}"<#if value!=''> value="${value}"</#if><#if tabIndex!=''> tabindex="${tabIndex}"</#if><#if checked> checked</#if><#if disabled> disabled</#if><#if readonly> readonly</#if><#if mandatory> required</#if><#if params!=''> ${params}</#if> />
<span class="form-check-label"><#if labelKey!=''>${labelKey}<#else><#nested></#if></span>
</label>
<#if orientation='vertical'></div></#if>
</#macro>