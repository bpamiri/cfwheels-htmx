CFWheels HTMX Plugin
====================
This module adds the HTMX Request headers to the Params structure so they can be used more readily in your controllers.

## LICENSE
Apache License, Version 2.0.

## SYSTEM REQUIREMENTS
- Lucee 5+
- ColdFusion 9+
- CFWheels 2+

---

# Instructions
Just drop the zip file into your `plugins` folder and restart your application or use the wheels cli to install

`box install cfwheels-htmx`

## USAGE
Issue a htmx request to the backend and look into the params structure for a htmx node that will have all the htmx headers set by the htmx pacakage. This makes is easier to write our controller logic to properly take the this state into account. A very common pattern is to call a controller that may return only a partial if the request is a htmx request versus returning the complete view file that would load the layout as well.