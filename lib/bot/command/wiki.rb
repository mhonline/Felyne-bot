module Commands
  # Command Module
  module Wiki
    extend Discordrb::Commands::CommandContainer
    command(
      [:wiki, :w, :site],
      bucket: :delay10,
      description: 'Searches the Wiki',
      usage: 'wiki <search>'
    ) do |event, list, *search|
      base_url = 'https://reaver01.github.io'
      wikilinks = [
        'armor', 'cats', 'crafting', 'faq', 'food', 'gathering', 'hunter-set',
        'hunter-set/#blademaster', 'hunter-set/#gunner', 'hunter-set/#list',
        'hunter-set/#info', 'hunting-groups', 'install', 'jewelry', 'materials',
        'monsters', 'monsters/akura-jebia', 'monsters/akura-vashimu',
        'monsters/azure-rathalos', 'monsters/baelidae', 'monsters/basarios',
        'monsters/blangonga', 'monsters/blue-yian-kut-ku', 'monsters/bulldrome',
        'monsters/burning-tartaronis', 'monsters/caeserber',
        'monsters/cephadrome', 'monsters/chameleos', 'monsters/chramine',
        'monsters/conflagration-rathian', 'monsters/congalala',
        'monsters/crystal-basarios', 'monsters/daimyo-hermitaur',
        'monsters/diablos', 'monsters/doom-estrellian',
        'monsters/dread-baelidae', 'monsters/elemental-merphistophelin',
        'monsters/estrellian', 'monsters/flame-blangonga', 'monsters/gendrome',
        'monsters/ghost-caeserber', 'monsters/giadrome',
        'monsters/gold-congalala', 'monsters/gold-hypnocatrice',
        'monsters/gonngenn-hermitaur', 'monsters/gravios',
        'monsters/guren-shen-gaoren', 'monsters/gypceros',
        'monsters/hypnocatrice', 'monsters/ice-chramine', 'monsters/iodrome',
        'monsters/khezu', 'monsters/kushala-daora', 'monsters/lavasioth',
        'monsters/lightenna', 'monsters/merphistophelin', 'monsters/monoblos',
        'monsters/one-eared-yian-garuga', 'monsters/pink-rathian',
        'monsters/plesioth', 'monsters/purple-gypceros',
        'monsters/purple-slicemargl', 'monsters/rajang', 'monsters/rathalos',
        'monsters/rathian', 'monsters/red-khezu', 'monsters/sandstone-basarios',
        'monsters/shattered-monoblos', 'monsters/shen-gaoren',
        'monsters/shogun-ceanataur', 'monsters/silver-hypnocatrice',
        'monsters/slicemargl', 'monsters/swordmaster-shogun-ceanataur',
        'monsters/tartaronis', 'monsters/tepekki-shen-gaoren',
        'monsters/tigrex', 'monsters/velocidrome', 'monsters/white-monoblos',
        'monsters/yellow-caeserber', 'monsters/yian-garuga',
        'monsters/yian-kut-ku', 'mosaics', 'npcs', 'quests', 'quests/#arena',
        'quests/#bounty', 'quests/#elites', 'quests/#huntingmenu',
        'quests/#raids', 'quests/#tickets', 'quests/#unstable', 'skills',
        'talismans', 'talismans/table', 'translated', 'translation', 'vip',
        'weapon-stone', 'weapons', 'weapons/bow', 'weapons/bowgun',
        'weapons/dual-blades', 'weapons/greatsword', 'weapons/gunlance',
        'weapons/hammer', 'weapons/hunting-horn', 'weapons/lance',
        'weapons/longsword', 'weapons/switch-axe', 'weapons/sword-and-shield'
      ]
      search = search.join(' ')
      if list.nil?
        m = "<#{base_url}>"
      elsif list == 'mats'
        m = "<#{base_url}/materials/?search=#{search}>"
      elsif list == 'skills'
        m = "<#{base_url}/skills/?search=#{search}>"
      elsif list == 'armor'
        m = "<#{base_url}/armor/?search=#{search}>"
      elsif list == 'monsters'
        m = '<#{base_url}/monsters>'
      elsif list == 'random'
        m = "<#{base_url}/#{wikilinks[rand(0..(
          wikilinks.length - 1
        ))]}>"
      else
        wiki = wikilinks
        links = ''
        wiki.grep(/#{list}/).each do |x|
          links << "<#{base_url}/#{x}> \n"
        end
        m = if links.length > 2000
              'Output has too many characters. Please be more specific in you' \
              'r search.'
            elsif links.empty?
              "I wasn't able to dig up any results.  Please try something else!"
            else
              links
            end
      end
      command_log('wiki', event.user.name)
      m
    end
  end
end
