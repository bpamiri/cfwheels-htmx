component {
  function init(){
    this.title       = "htmx";
    this.author      = "Peter Amiri";
    this.description = "This plugin adds the htmx request headers to the params structure making them easier to use in your controllers."
    this.version     = "2.0.0,2.1.0,2.2.0,2.3.0";
    return this;
  }

  public struct function $createParams(
    required string path,
    required struct route,
    required struct formScope,
    required struct urlScope
  ) {
    local.rv = core.$createParams(argumentCollection = arguments);
    local.headers = getHTTPRequestData();
    local.htmx = {};

    /*Description
    HX-Request
    will be set to "true"
    HX-Trigger
    will be set to the id of the element that triggered the request
    HX-Trigger-Name
    will be set to the name of the element that triggered the request
    HX-Target
    will be set to the id of the target element
    HX-Prompt*/

    
    //see if we have a htmx request
    if (structKeyExists(local.headers.headers,"HX-Request") && local.headers.headers[ "HX-Request" ]) {
      local.htmx[ "request" ] = true;
    } else {
      local.htmx[ "request" ] = false;
    }

    if (structKeyExists(local.headers.headers,"HX-Trigger") ) {
      local.htmx[ "trigger" ] = local.headers.headers[ "HX-Trigger" ];
    }

    if (structKeyExists(local.headers.headers,"HX-Trigger-Name") ) {
      local.htmx[ "triggerName" ] = local.headers.headers[ "HX-Trigger-Name" ];
    }

    if (structKeyExists(local.headers.headers,"HX-Target") ) {
      local.htmx[ "target" ] = local.headers.headers[ "HX-Target" ];
    }

    if (structKeyExists(local.headers.headers,"HX-Prompt") ) {
      local.htmx[ "prompt" ] = local.headers.headers[ "HX-Prompt" ];
    }

    if (structKeyExists(local.headers.headers,"HX-Current-URL") ) {
      local.htmx[ "currentUrl" ] = local.headers.headers[ "HX-Current-URL" ];
    }
    
    //local.rv.headers = local.headers;
    local.rv[ "htmx" ] = local.htmx;

    return local.rv;
  }

}