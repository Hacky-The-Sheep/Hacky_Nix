{
  hardware.printers = {
    ensurePrinters = [
      {
        name = "TechDeckStudent";
        location = "Work";
        deviceUri = "http://10.0.2.10";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "TechDeckStudent";
  };
}
