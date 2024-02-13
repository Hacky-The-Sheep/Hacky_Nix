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
      {
        name = "Toshiba1";
        location = "Work";
        deviceUri = "http://10.0.2.71";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
      {
        name = "Home Brother";
        location = "Home";
        deviceUri = "http://10.0.0.6";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "TechDeckStudent";
  };
}
