/**
*  supports/purchase
*
*  Actor for the "Purchase support" dialog button
*
*  Domain: Client
**/

_index = lbCurSel 1501;
shopVehic = objNull;

_shopItem = BULWARK_SUPPORTITEMS select _index;
_shopPrice = (_shopItem) select 0;
_shopName  = (_shopItem) select 1;
_shopClass = (_shopItem) select 2;

// Script was passed an invalid number
if(_shopClass == "") exitWith {};

   

if(player getVariable "killPoints" >= _shopPrice) then {
    [player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];
    if(_shopClass != "lootDrone") then {
    [player, _shopClass] call BIS_fnc_addCommMenuItem;
    }else{
        [ [],'supports\lootDrone.sqf'] remoteExec ['execVM',0];
    };
    [format ["<t size='0.6' color='#00ff00'> Purchased  %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
    objPurchase = false;
};
