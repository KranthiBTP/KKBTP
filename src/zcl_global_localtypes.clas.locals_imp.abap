*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS ZCL_EARTH DEFINITION.
 PUBLIC SECTION.
 METHODS:start_engine RETURNING  value(r_value) type string.
 METHODS:leave_orbit RETURNING value(r_value) type string.
ENDCLASS.

CLASS ZCL_EARTH IMPLEMENTATION.
METHOD start_engine .
r_value = 'we take off from earth'.
ENDMETHOD.
METHOD leave_orbit.
r_value = 'leave earth'.
ENDMETHOD.
ENDCLASS.

CLASS ZCL_PLANET1 DEFINITION.
PUBLIC SECTION.
METHODS enter_orbit RETURNING value(r_value) type string.
METHODS leave_orbit RETURNING value(r_value) type string.
ENDCLASS.

CLASS ZCL_PLANET1 IMPLEMENTATION.
METHOD enter_orbit.
r_value = 'We enter planet'.
ENDMETHOD.

METHOD leave_orbit.
r_value = 'leave planet'.
ENDMETHOD.

ENDCLASS.


CLASS ZCL_MARS DEFINITION.
PUBLIC SECTION.
METHODS enter_orbit RETURNING value(r_value) type string.
methods explore_mars RETURNING value(r_value) type string.
ENDCLASS.

CLASS ZCL_MARS IMPLEMENTATION.
METHOD enter_orbit .
r_value = 'enter mars'.
ENDMETHOD.
METHOD explore_mars.
r_value = 'exploring mars'.
ENDMETHOD.
ENDCLASS.
