params ["_targetPos"];
[_targetPos, ["<t color='#00ff00'>" + "FILL AMMO", "supports\ammoDrop.sqf","",2,true,false,"true","true",4], "B_T_VTOL_01_vehicle_F"] remoteExec ["supports_fnc_supplyDrop", 2];