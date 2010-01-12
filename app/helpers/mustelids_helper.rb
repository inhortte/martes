module MustelidsHelper

  # sf == subfamily
  def getGenus(sf)
    return Genus.find_all_by_subfamily_id(sf)
  end

  def getSpecies(g)
    return Species.find_all_by_genus_id(g)
  end

  def setup_mustelid(mustelid)
    returning(mustelid) do |m|
      m.detaloj.build if m.detaloj.empty?
    end
  end

end
