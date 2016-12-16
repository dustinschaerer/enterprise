class PuppetModuleFetcher

  def initialize()
  end

  def get_modules
    enumerator = PuppetForge::Module.all.unpaginated
    enumerator.each do |mod|
      puts mod.name
      puts mod.slug

      @puppet_module = PuppetModule.create(name: mod.name,
                                           slug: mod.slug,
                                           uri: mod.uri,
                                           downloads: mod.downloads,
                                           supported: mod.supported,
                                           homepage_url: mod.homepage_url,
                                           owner: mod.owner.username,
                                           current_release_version: mod.current_release.version,
                                           release_supported: mod.current_release.supported)
      puts "------------------"
    end
  end
end


