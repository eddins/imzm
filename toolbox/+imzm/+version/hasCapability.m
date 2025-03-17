function tf = hasCapability(capability)
    capabilities = "units_fix";

    tf = any(capability == capabilities);
end