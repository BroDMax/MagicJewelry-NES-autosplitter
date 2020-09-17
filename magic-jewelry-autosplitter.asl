state("fceux")
{
    byte level:             0x3B1388, 0x6D;
    byte reset:             0x3B1388, 0x6F;
}

state("nestopia")
{
    byte level:             "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xD5;
    byte reset:             "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xD7;
}

state("mednafen")
{
    byte level:             "mednafen.exe", 0xBE1D4D;
    byte reset:             "mednafen.exe", 0xBE1D4F;
}

state("punes64")
{
    byte level:             0x13F176D;
    byte reset:             0x13F176F;
}

state("nintendulator")
{
    byte level:             0x5C135;
    byte reset:             0x5C137;
}

state("mesen", "0.9.7.0")
{
    byte level:             "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x6D;
    byte reset:             "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x6F;
}

state("mesen", "0.9.8.0")
{
    byte level:             "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x6D;
    byte reset:             "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x6F;
}

state("mesen", "0.9.9.0")
{
    byte level:             "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x6D;
    byte reset:             "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x6F;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

start
{
    return old.reset == 0x00 && current.reset == 0x01;
}

split
{
    return current.level > old.level;
}

reset
{
    return old.reset != 0x00 && current.reset == 0x00;
}
