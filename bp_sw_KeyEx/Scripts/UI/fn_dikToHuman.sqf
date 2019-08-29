params["_dik"];
_lookupTable = [
	["F1",0x3B],
	["F2",0x3C],
	["F3",0x3D],
	["F4",0x3E],
	["F5",0x3F],
	["F6",0x40],
	["F7",0x41],
	["F8",0x42],
	["F9",0x43],
	["F10",0x44],
	["F11",0x57],
	["F12",0x58],
	["0",0x0B],
	["1",0x02],
	["2",0x03],
	["3",0x04],
	["4",0x05],
	["5",0x06],
	["6",0x07],
	["7",0x08],
	["8",0x09],
	["9",0x0A],
	["APOSTROPHE",0x28],
	["NUMPAD0",0x52],
	["NUMPAD1",0x4F],
	["NUMPAD2",0x50],
	["NUMPAD3",0x51],
	["NUMPAD4",0x4B],
	["NUMPAD5",0x4C],
	["NUMPAD6",0x4D],
	["NUMPAD7",0x47],
	["NUMPAD8",0x48],
	["NUMPAD9",0x49],
	["NUMPADENTER",0x9C],
	["DECIMAL",0x53],
	["MULTIPLY",0x37],
	["A",0x1E],
	["B",0x30],
	["C",0x2E],
	["D",0x20],
	["E",0x12],
	["F",0x21],
	["G",0x22],
	["H",0x23],
	["I",0x17],
	["J",0x24],
	["K",0x25],
	["L",0x26],
	["M",0x32],
	["N",0x31],
	["O",0x18],
	["P",0x19],
	["Q",0x10],
	["R",0x13],
	["S",0x1F],
	["T",0x14],
	["U",0x16],
	["V",0x2F],
	["W",0x11],
	["X",0x2D],
	["Y",0x15],
	["Z",0x2C],
	["ESCAPE",0x01],
	["TAB",0x0F],
	["BACKSPACE",0x0E],
	["ENTER",0x1C],
	["SPACE",0x39],
	["END",0xCF],
	["HOME",0xC7],
	["Prim. Mouse Btn.",-1],
	["Sec. Mouse Btn.",-2]
];

_return = "";

{
	if((_x select 1) == _dik) exitWith {
		_return = _x select 0;
	};
} forEach _lookupTable;


_return;