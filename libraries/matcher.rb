if defined?(ChefSpec)

  [:config, :add, :delete].each do |action|
    self.class.send(:define_method, "#{action}_iis_app", proc do |app_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_app, action, app_name)
    end
                   )
  end

  [:set, :clear, :config].each do |action|
    self.class.send(:define_method, "#{action}_iis_config", proc do |config_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_config, action, config_name)
    end
                   )
  end

  [:add, :delete, :install, :uninstall].each do |action|
    self.class.send(:define_method, "#{action}_iis_module", proc do |module_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_module, action, module_name)
    end
                   )
  end

  [:add, :config, :delete, :start, :stop, :restart, :recycle].each do |action|
    self.class.send(:define_method, "#{action}_iis_pool", proc do |pool_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_pool, action, pool_name)
    end
                   )
  end

  [:add, :delete, :start, :config].each do |action|
    self.class.send(:define_method, "#{action}_iis_root", proc do |root_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_root, action, root_name)
    end
                   )
  end

  [:lock, :unlock].each do |action|
    self.class.send(:define_method, "#{action}_iis_section", proc do |section|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_section, action, section)
    end
                   )
  end

  [:add, :delete, :start, :stop, :restart, :config].each do |action|
    self.class.send(:define_method, "#{action}_iis_site", proc do |site_name|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_site, action, site_name)
    end
                   )
  end

  [:add, :config, :delete].each do |action|
    self.class.send(:define_method, "#{action}_iis_vdir", proc do |section|
      ChefSpec::Matchers::ResourceMatcher.new(:iis_vdir, action, section)
    end
                   )
  end

  define_method = if Gem.loaded_specs['chefspec'].version < Gem::Version.new('4.1.0')
                    ChefSpec::Runner.method(:define_runner_method)
                  else
                    ChefSpec.method(:define_matcher)
                  end

  define_method.call :iis_app
  define_method.call :iis_config
  define_method.call :iis_module
  define_method.call :iis_pool
  define_method.call :iis_section
  define_method.call :iis_site
  define_method.call :iis_vdir
end
