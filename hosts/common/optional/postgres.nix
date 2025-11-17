{
  services.postgresql.enable = true;

  envrionment.persistence = {
    "/persist".directories = [{
      directory = "/var/lib/postgresql";
      user = "postgres";
      group = "postgres";
      mode = "0700";
    }];
  };
}
