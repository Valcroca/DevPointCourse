module StiHelper
  #return a dynamic path based on the params that were passed in
  def sti_animal_path(zoo, race = 'animal', animal = nil, action = nil)
    send "#{format_sti(action, race, animal)}_path", zoo, animal
  end

  def format_sti(action, race, animal)
    #if we have an action or an animal do line 10 else do line 11
    action || animal ? 
    "#{format_action(action)}#{race.underscore}" : 
    "zoo_#{race.underscore.pluralize}"

    # if action || animal
    #   "#{format_action(action)}#{race.underscore}" 
    # else
    #   "zoo_#{race.underscore.pluralize}"
    # end

  end

  def format_action(action)
    action ? "#{action}_zoo_" :
    "zoo_"
  end
end