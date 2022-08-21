# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App.Repo.insert!(%App.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias App.Repo
alias App.Accounts
alias App.Blog
alias App.Blog.{Post, Comment, Tag}

{:ok, author} = Accounts.register_user(
  %{
    "first_name"=> "John",
    "last_name"=> "Doe",
    "email"=> "johndoe@mail.com",
    "password"=> "1234567890000",
    "roles"=> ["admin", "owner"]
  }
)



posts = [
  %{
    "content" =>
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    "excerpt" => "quia et suscipit\nsuscipit recusandae consequuntur expedita et",
    "featured_image" => "N/A",
    "slug" => "sunt-aut-facere-repellat-provident-occaecati-excepturi-optio-reprehenderit",
    "title" => "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
    "excerpt" => "est rerum tempore vitae\nsequi sint nihil reprehenderit",
    "featured_image" => "N/A",
    "slug" => "qui-est-esse",
    "title" => "qui est esse",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
    "excerpt" => "et iusto sed quo iure\nvoluptatem occaecati omnis",
    "featured_image" => "N/A",
    "slug" => "ea-molestias-quasi-exercitationem-repellat-qui-ipsa-sit-aut",
    "title" => "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
    "excerpt" => "ullam et saepe reiciendis voluptatem adipisci\nsit amet",
    "featured_image" => "N/A",
    "slug" => "eum-et-est-occaecati",
    "title" => "eum et est occaecati",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque",
    "excerpt" => "repudiandae veniam quaerat sunt sed\nalias aut fugiat",
    "featured_image" => "N/A",
    "slug" => "nesciunt-quas-odio",
    "title" => "nesciunt quas odio",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae",
    "excerpt" => "ut aspernatur corporis harum nihil quis provident sequi",
    "featured_image" => "N/A",
    "slug" => "dolorem-eum-magni-eos-aperiam-quia",
    "title" => "dolorem eum magni eos aperiam quia",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "dolore placeat quibusdam ea quo vitae\nmagni quis enim qui quis quo nemo aut saepe\nquidem repellat excepturi ut quia\nsunt ut sequi eos ea sed quas",
    "excerpt" => "dolore placeat quibusdam ea quo vitae\nmagni quis",
    "featured_image" => "N/A",
    "slug" => "magnam-facilis-autem",
    "title" => "magnam facilis autem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "dignissimos aperiam dolorem qui eum\nfacilis quibusdam animi sint suscipit qui sint possimus cum\nquaerat magni maiores excepturi\nipsam ut commodi dolor voluptatum modi aut vitae",
    "excerpt" => "dignissimos aperiam dolorem qui eum\nfacilis quibusdam animi",
    "featured_image" => "N/A",
    "slug" => "dolorem-dolore-est-ipsam",
    "title" => "dolorem dolore est ipsam",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "consectetur animi nesciunt iure dolore\nenim quia ad\nveniam autem ut quam aut nobis\net est aut quod aut provident voluptas autem voluptas",
    "excerpt" => "consectetur animi nesciunt iure dolore\nenim quia ad",
    "featured_image" => "N/A",
    "slug" => "nesciunt-iure-omnis-dolorem-tempora-et-accusantium",
    "title" => "nesciunt iure omnis dolorem tempora et accusantium",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "quo et expedita modi cum officia vel magni\ndoloribus qui repudiandae\nvero nisi sit\nquos veniam quod sed accusamus veritatis error",
    "excerpt" => "quo et expedita modi cum officia vel magni",
    "featured_image" => "N/A",
    "slug" => "optio-molestias-id-quia-eum",
    "title" => "optio molestias id quia eum",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "delectus reiciendis molestiae occaecati non minima eveniet qui voluptatibus\naccusamus in eum beatae sit\nvel qui neque voluptates ut commodi qui incidunt\nut animi commodi",
    "excerpt" => "delectus reiciendis molestiae occaecati non minima eveniet qui",
    "featured_image" => "N/A",
    "slug" => "et-ea-vero-quia-laudantium-autem",
    "title" => "et ea vero quia laudantium autem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "itaque id aut magnam\npraesentium quia et ea odit et ea voluptas et\nsapiente quia nihil amet occaecati quia id voluptatem\nincidunt ea est distinctio odio",
    "excerpt" => "itaque id aut magnam\npraesentium quia et ea",
    "featured_image" => "N/A",
    "slug" => "in-quibusdam-tempore-odit-est-dolorem",
    "title" => "in quibusdam tempore odit est dolorem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "aut dicta possimus sint mollitia voluptas commodi quo doloremque\niste corrupti reiciendis voluptatem eius rerum\nsit cumque quod eligendi laborum minima\nperferendis recusandae assumenda consectetur porro architecto ipsum ipsam",
    "excerpt" => "aut dicta possimus sint mollitia voluptas commodi quo",
    "featured_image" => "N/A",
    "slug" => "dolorum-ut-in-voluptas-mollitia-et-saepe-quo-animi",
    "title" => "dolorum ut in voluptas mollitia et saepe quo animi",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "fuga et accusamus dolorum perferendis illo voluptas\nnon doloremque neque facere\nad qui dolorum molestiae beatae\nsed aut voluptas totam sit illum",
    "excerpt" => "fuga et accusamus dolorum perferendis illo voluptas\nnon",
    "featured_image" => "N/A",
    "slug" => "voluptatem-eligendi-optio",
    "title" => "voluptatem eligendi optio",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "reprehenderit quos placeat\nvelit minima officia dolores impedit repudiandae molestiae nam\nvoluptas recusandae quis delectus\nofficiis harum fugiat vitae",
    "excerpt" => "reprehenderit quos placeat\nvelit minima officia dolores impedit",
    "featured_image" => "N/A",
    "slug" => "eveniet-quod-temporibus",
    "title" => "eveniet quod temporibus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "suscipit nam nisi quo aperiam aut\nasperiores eos fugit maiores voluptatibus quia\nvoluptatem quis ullam qui in alias quia est\nconsequatur magni mollitia accusamus ea nisi voluptate dicta",
    "excerpt" => "suscipit nam nisi quo aperiam aut\nasperiores eos",
    "featured_image" => "N/A",
    "slug" => "sint-suscipit-perspiciatis-velit-dolorum-rerum-ipsa-laboriosam-odio",
    "title" => "sint suscipit perspiciatis velit dolorum rerum ipsa laboriosam odio",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eos voluptas et aut odit natus earum\naspernatur fuga molestiae ullam\ndeserunt ratione qui eos\nqui nihil ratione nemo velit ut aut id quo",
    "excerpt" => "eos voluptas et aut odit natus earum\naspernatur",
    "featured_image" => "N/A",
    "slug" => "fugit-voluptas-sed-molestias-voluptatem-provident",
    "title" => "fugit voluptas sed molestias voluptatem provident",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eveniet quo quis\nlaborum totam consequatur non dolor\nut et est repudiandae\nest voluptatem vel debitis et magnam",
    "excerpt" => "eveniet quo quis\nlaborum totam consequatur non dolor",
    "featured_image" => "N/A",
    "slug" => "voluptate-et-itaque-vero-tempora-molestiae",
    "title" => "voluptate et itaque vero tempora molestiae",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "illum quis cupiditate provident sit magnam\nea sed aut omnis\nveniam maiores ullam consequatur atque\nadipisci quo iste expedita sit quos voluptas",
    "excerpt" => "illum quis cupiditate provident sit magnam\nea sed",
    "featured_image" => "N/A",
    "slug" => "adipisci-placeat-illum-aut-reiciendis-qui",
    "title" => "adipisci placeat illum aut reiciendis qui",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "qui consequuntur ducimus possimus quisquam amet similique\nsuscipit porro ipsam amet\neos veritatis officiis exercitationem vel fugit aut necessitatibus totam\nomnis rerum consequatur expedita quidem cumque explicabo",
    "excerpt" => "qui consequuntur ducimus possimus quisquam amet similique\nsuscipit",
    "featured_image" => "N/A",
    "slug" => "doloribus-ad-provident-suscipit-at",
    "title" => "doloribus ad provident suscipit at",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "repellat aliquid praesentium dolorem quo\nsed totam minus non itaque\nnihil labore molestiae sunt dolor eveniet hic recusandae veniam\ntempora et tenetur expedita sunt",
    "excerpt" => "repellat aliquid praesentium dolorem quo\nsed totam minus",
    "featured_image" => "N/A",
    "slug" => "asperiores-ea-ipsam-voluptatibus-modi-minima-quia-sint",
    "title" => "asperiores ea ipsam voluptatibus modi minima quia sint",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eos qui et ipsum ipsam suscipit aut\nsed omnis non odio\nexpedita earum mollitia molestiae aut atque rem suscipit\nnam impedit esse",
    "excerpt" => "eos qui et ipsum ipsam suscipit aut\nsed",
    "featured_image" => "N/A",
    "slug" => "dolor-sint-quo-a-velit-explicabo-quia-nam",
    "title" => "dolor sint quo a velit explicabo quia nam",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "veritatis unde neque eligendi\nquae quod architecto quo neque vitae\nest illo sit tempora doloremque fugit quod\net et vel beatae sequi ullam sed tenetur perspiciatis",
    "excerpt" => "veritatis unde neque eligendi\nquae quod architecto quo",
    "featured_image" => "N/A",
    "slug" => "maxime-id-vitae-nihil-numquam",
    "title" => "maxime id vitae nihil numquam",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "enim et ex nulla\nomnis voluptas quia qui\nvoluptatem consequatur numquam aliquam sunt\ntotam recusandae id dignissimos aut sed asperiores deserunt",
    "excerpt" => "enim et ex nulla\nomnis voluptas quia qui",
    "featured_image" => "N/A",
    "slug" => "autem-hic-labore-sunt-dolores-incidunt",
    "title" => "autem hic labore sunt dolores incidunt",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ullam consequatur ut\nomnis quis sit vel consequuntur\nipsa eligendi ipsum molestiae et omnis error nostrum\nmolestiae illo tempore quia et distinctio",
    "excerpt" => "ullam consequatur ut\nomnis quis sit vel consequuntur",
    "featured_image" => "N/A",
    "slug" => "rem-alias-distinctio-quo-quis",
    "title" => "rem alias distinctio quo quis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "similique esse doloribus nihil accusamus\nomnis dolorem fuga consequuntur reprehenderit fugit recusandae temporibus\nperspiciatis cum ut laudantium\nomnis aut molestiae vel vero",
    "excerpt" => "similique esse doloribus nihil accusamus\nomnis dolorem fuga",
    "featured_image" => "N/A",
    "slug" => "est-et-quae-odit-qui-non",
    "title" => "est et quae odit qui non",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eum sed dolores ipsam sint possimus debitis occaecati\ndebitis qui qui et\nut placeat enim earum aut odit facilis\nconsequatur suscipit necessitatibus rerum sed inventore temporibus consequatur",
    "excerpt" => "eum sed dolores ipsam sint possimus debitis occaecati",
    "featured_image" => "N/A",
    "slug" => "quasi-id-et-eos-tenetur-aut-quo-autem",
    "title" => "quasi id et eos tenetur aut quo autem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "non et quaerat ex quae ad maiores\nmaiores recusandae totam aut blanditiis mollitia quas illo\nut voluptatibus voluptatem\nsimilique nostrum eum",
    "excerpt" => "non et quaerat ex quae ad maiores\nmaiores",
    "featured_image" => "N/A",
    "slug" => "delectus-ullam-et-corporis-nulla-voluptas-sequi",
    "title" => "delectus ullam et corporis nulla voluptas sequi",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "odit magnam ut saepe sed non qui\ntempora atque nihil\naccusamus illum doloribus illo dolor\neligendi repudiandae odit magni similique sed cum maiores",
    "excerpt" => "odit magnam ut saepe sed non qui\ntempora",
    "featured_image" => "N/A",
    "slug" => "iusto-eius-quod-necessitatibus-culpa-ea",
    "title" => "iusto eius quod necessitatibus culpa ea",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "alias dolor cumque\nimpedit blanditiis non eveniet odio maxime\nblanditiis amet eius quis tempora quia autem rem\na provident perspiciatis quia",
    "excerpt" => "alias dolor cumque\nimpedit blanditiis non eveniet odio",
    "featured_image" => "N/A",
    "slug" => "a-quo-magni-similique-perferendis",
    "title" => "a quo magni similique perferendis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "debitis eius sed quibusdam non quis consectetur vitae\nimpedit ut qui consequatur sed aut in\nquidem sit nostrum et maiores adipisci atque\nquaerat voluptatem adipisci repudiandae",
    "excerpt" => "debitis eius sed quibusdam non quis consectetur vitae",
    "featured_image" => "N/A",
    "slug" => "ullam-ut-quidem-id-aut-vel-consequuntur",
    "title" => "ullam ut quidem id aut vel consequuntur",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "deserunt eos nobis asperiores et hic\nest debitis repellat molestiae optio\nnihil ratione ut eos beatae quibusdam distinctio maiores\nearum voluptates et aut adipisci ea maiores voluptas maxime",
    "excerpt" => "deserunt eos nobis asperiores et hic\nest debitis",
    "featured_image" => "N/A",
    "slug" => "doloremque-illum-aliquid-sunt",
    "title" => "doloremque illum aliquid sunt",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "rerum ut et numquam laborum odit est sit\nid qui sint in\nquasi tenetur tempore aperiam et quaerat qui in\nrerum officiis sequi cumque quod",
    "excerpt" => "rerum ut et numquam laborum odit est sit",
    "featured_image" => "N/A",
    "slug" => "qui-explicabo-molestiae-dolorem",
    "title" => "qui explicabo molestiae dolorem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ea velit perferendis earum ut voluptatem voluptate itaque iusto\ntotam pariatur in\nnemo voluptatem voluptatem autem magni tempora minima in\nest distinctio qui assumenda accusamus dignissimos officia nesciunt nobis",
    "excerpt" => "ea velit perferendis earum ut voluptatem voluptate itaque",
    "featured_image" => "N/A",
    "slug" => "magnam-ut-rerum-iure",
    "title" => "magnam ut rerum iure",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "nisi error delectus possimus ut eligendi vitae\nplaceat eos harum cupiditate facilis reprehenderit voluptatem beatae\nmodi ducimus quo illum voluptas eligendi\net nobis quia fugit",
    "excerpt" => "nisi error delectus possimus ut eligendi vitae\nplaceat",
    "featured_image" => "N/A",
    "slug" => "id-nihil-consequatur-molestias-animi-provident",
    "title" => "id nihil consequatur molestias animi provident",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ad mollitia et omnis minus architecto odit\nvoluptas doloremque maxime aut non ipsa qui alias veniam\nblanditiis culpa aut quia nihil cumque facere et occaecati\nqui aspernatur quia eaque ut aperiam inventore",
    "excerpt" => "ad mollitia et omnis minus architecto odit\nvoluptas",
    "featured_image" => "N/A",
    "slug" => "fuga-nam-accusamus-voluptas-reiciendis-itaque",
    "title" => "fuga nam accusamus voluptas reiciendis itaque",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "debitis et eaque non officia sed nesciunt pariatur vel\nvoluptatem iste vero et ea\nnumquam aut expedita ipsum nulla in\nvoluptates omnis consequatur aut enim officiis in quam qui",
    "excerpt" => "debitis et eaque non officia sed nesciunt pariatur",
    "featured_image" => "N/A",
    "slug" => "provident-vel-ut-sit-ratione-est",
    "title" => "provident vel ut sit ratione est",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "animi esse sit aut sit nesciunt assumenda eum voluptas\nquia voluptatibus provident quia necessitatibus ea\nrerum repudiandae quia voluptatem delectus fugit aut id quia\nratione optio eos iusto veniam iure",
    "excerpt" => "animi esse sit aut sit nesciunt assumenda eum",
    "featured_image" => "N/A",
    "slug" => "explicabo-et-eos-deleniti-nostrum-ab-id-repellendus",
    "title" => "explicabo et eos deleniti nostrum ab id repellendus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "corporis rerum ducimus vel eum accusantium\nmaxime aspernatur a porro possimus iste omnis\nest in deleniti asperiores fuga aut\nvoluptas sapiente vel dolore minus voluptatem incidunt ex",
    "excerpt" => "corporis rerum ducimus vel eum accusantium\nmaxime aspernatur",
    "featured_image" => "N/A",
    "slug" => "eos-dolorem-iste-accusantium-est-eaque-quam",
    "title" => "eos dolorem iste accusantium est eaque quam",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ut voluptatum aliquid illo tenetur nemo sequi quo facilis\nipsum rem optio mollitia quas\nvoluptatem eum voluptas qui\nunde omnis voluptatem iure quasi maxime voluptas nam",
    "excerpt" => "ut voluptatum aliquid illo tenetur nemo sequi quo",
    "featured_image" => "N/A",
    "slug" => "enim-quo-cumque",
    "title" => "enim quo cumque",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "molestias id nostrum\nexcepturi molestiae dolore omnis repellendus quaerat saepe\nconsectetur iste quaerat tenetur asperiores accusamus ex ut\nnam quidem est ducimus sunt debitis saepe",
    "excerpt" => "molestias id nostrum\nexcepturi molestiae dolore omnis repellendus",
    "featured_image" => "N/A",
    "slug" => "non-est-facere",
    "title" => "non est facere",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "odio fugit voluptatum ducimus earum autem est incidunt voluptatem\nodit reiciendis aliquam sunt sequi nulla dolorem\nnon facere repellendus voluptates quia\nratione harum vitae ut",
    "excerpt" => "odio fugit voluptatum ducimus earum autem est incidunt",
    "featured_image" => "N/A",
    "slug" => "commodi-ullam-sint-et-excepturi-error-explicabo-praesentium-voluptas",
    "title" => "commodi ullam sint et excepturi error explicabo praesentium voluptas",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "similique fugit est\nillum et dolorum harum et voluptate eaque quidem\nexercitationem quos nam commodi possimus cum odio nihil nulla\ndolorum exercitationem magnam ex et a et distinctio debitis",
    "excerpt" => "similique fugit est\nillum et dolorum harum et",
    "featured_image" => "N/A",
    "slug" => "eligendi-iste-nostrum-consequuntur-adipisci-praesentium-sit-beatae-perferendis",
    "title" => "eligendi iste nostrum consequuntur adipisci praesentium sit beatae perferendis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "temporibus est consectetur dolore\net libero debitis vel velit laboriosam quia\nipsum quibusdam qui itaque fuga rem aut\nea et iure quam sed maxime ut distinctio quae",
    "excerpt" => "temporibus est consectetur dolore\net libero debitis vel",
    "featured_image" => "N/A",
    "slug" => "optio-dolor-molestias-sit",
    "title" => "optio dolor molestias sit",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "est natus reiciendis nihil possimus aut provident\nex et dolor\nrepellat pariatur est\nnobis rerum repellendus dolorem autem",
    "excerpt" => "est natus reiciendis nihil possimus aut provident\nex",
    "featured_image" => "N/A",
    "slug" => "ut-numquam-possimus-omnis-eius-suscipit-laudantium-iure",
    "title" => "ut numquam possimus omnis eius suscipit laudantium iure",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "voluptatem quisquam iste\nvoluptatibus natus officiis facilis dolorem\nquis quas ipsam\nvel et voluptatum in aliquid",
    "excerpt" => "voluptatem quisquam iste\nvoluptatibus natus officiis facilis dolorem",
    "featured_image" => "N/A",
    "slug" => "aut-quo-modi-neque-nostrum-ducimus",
    "title" => "aut quo modi neque nostrum ducimus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "voluptatem assumenda ut qui ut cupiditate aut impedit veniam\noccaecati nemo illum voluptatem laudantium\nmolestiae beatae rerum ea iure soluta nostrum\neligendi et voluptate",
    "excerpt" => "voluptatem assumenda ut qui ut cupiditate aut impedit",
    "featured_image" => "N/A",
    "slug" => "quibusdam-cumque-rem-aut-deserunt",
    "title" => "quibusdam cumque rem aut deserunt",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "voluptates quo voluptatem facilis iure occaecati\nvel assumenda rerum officia et\nillum perspiciatis ab deleniti\nlaudantium repellat ad ut et autem reprehenderit",
    "excerpt" => "voluptates quo voluptatem facilis iure occaecati\nvel assumenda",
    "featured_image" => "N/A",
    "slug" => "ut-voluptatem-illum-ea-doloribus-itaque-eos",
    "title" => "ut voluptatem illum ea doloribus itaque eos",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "inventore ab sint\nnatus fugit id nulla sequi architecto nihil quaerat\neos tenetur in in eum veritatis non\nquibusdam officiis aspernatur cumque aut commodi aut",
    "excerpt" => "inventore ab sint\nnatus fugit id nulla sequi",
    "featured_image" => "N/A",
    "slug" => "laborum-non-sunt-aut-ut-assumenda-perspiciatis-voluptas",
    "title" => "laborum non sunt aut ut assumenda perspiciatis voluptas",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "error suscipit maxime adipisci consequuntur recusandae\nvoluptas eligendi et est et voluptates\nquia distinctio ab amet quaerat molestiae et vitae\nadipisci impedit sequi nesciunt quis consectetur",
    "excerpt" => "error suscipit maxime adipisci consequuntur recusandae\nvoluptas eligendi",
    "featured_image" => "N/A",
    "slug" => "repellendus-qui-recusandae-incidunt-voluptates-tenetur-qui-omnis-exercitationem",
    "title" => "repellendus qui recusandae incidunt voluptates tenetur qui omnis exercitationem",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "sunt dolores aut doloribus\ndolore doloribus voluptates tempora et\ndoloremque et quo\ncum asperiores sit consectetur dolorem",
    "excerpt" => "sunt dolores aut doloribus\ndolore doloribus voluptates tempora",
    "featured_image" => "N/A",
    "slug" => "soluta-aliquam-aperiam-consequatur-illo-quis-voluptas",
    "title" => "soluta aliquam aperiam consequatur illo quis voluptas",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "iusto est quibusdam fuga quas quaerat molestias\na enim ut sit accusamus enim\ntemporibus iusto accusantium provident architecto\nsoluta esse reprehenderit qui laborum",
    "excerpt" => "iusto est quibusdam fuga quas quaerat molestias\na",
    "featured_image" => "N/A",
    "slug" => "qui-enim-et-consequuntur-quia-animi-quis-voluptate-quibusdam",
    "title" => "qui enim et consequuntur quia animi quis voluptate quibusdam",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "minima harum praesentium eum rerum illo dolore\nquasi exercitationem rerum nam\nporro quis neque quo\nconsequatur minus dolor quidem veritatis sunt non explicabo similique",
    "excerpt" => "minima harum praesentium eum rerum illo dolore\nquasi",
    "featured_image" => "N/A",
    "slug" => "ut-quo-aut-ducimus-alias",
    "title" => "ut quo aut ducimus alias",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "totam corporis dignissimos\nvitae dolorem ut occaecati accusamus\nex velit deserunt\net exercitationem vero incidunt corrupti mollitia",
    "excerpt" => "totam corporis dignissimos\nvitae dolorem ut occaecati accusamus",
    "featured_image" => "N/A",
    "slug" => "sit-asperiores-ipsam-eveniet-odio-non-quia",
    "title" => "sit asperiores ipsam eveniet odio non quia",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "debitis excepturi ea perferendis harum libero optio\neos accusamus cum fuga ut sapiente repudiandae\net ut incidunt omnis molestiae\nnihil ut eum odit",
    "excerpt" => "debitis excepturi ea perferendis harum libero optio\neos",
    "featured_image" => "N/A",
    "slug" => "sit-vel-voluptatem-et-non-libero",
    "title" => "sit vel voluptatem et non libero",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "aut est omnis dolores\nneque rerum quod ea rerum velit pariatur beatae excepturi\net provident voluptas corrupti\ncorporis harum reprehenderit dolores eligendi",
    "excerpt" => "aut est omnis dolores\nneque rerum quod ea",
    "featured_image" => "N/A",
    "slug" => "qui-et-at-rerum-necessitatibus",
    "title" => "qui et at rerum necessitatibus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "at pariatur consequuntur earum quidem\nquo est laudantium soluta voluptatem\nqui ullam et est\net cum voluptas voluptatum repellat est",
    "excerpt" => "at pariatur consequuntur earum quidem\nquo est laudantium",
    "featured_image" => "N/A",
    "slug" => "sed-ab-est-est",
    "title" => "sed ab est est",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "veniam voluptatum quae adipisci id\net id quia eos ad et dolorem\naliquam quo nisi sunt eos impedit error\nad similique veniam",
    "excerpt" => "veniam voluptatum quae adipisci id\net id quia",
    "featured_image" => "N/A",
    "slug" => "voluptatum-itaque-dolores-nisi-et-quasi",
    "title" => "voluptatum itaque dolores nisi et quasi",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "perspiciatis et quam ea autem temporibus non voluptatibus qui\nbeatae a earum officia nesciunt dolores suscipit voluptas et\nanimi doloribus cum rerum quas et magni\net hic ut ut commodi expedita sunt",
    "excerpt" => "perspiciatis et quam ea autem temporibus non voluptatibus",
    "featured_image" => "N/A",
    "slug" => "qui-commodi-dolor-at-maiores-et-quis-id-accusantium",
    "title" => "qui commodi dolor at maiores et quis id accusantium",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "asperiores sunt ab assumenda cumque modi velit\nqui esse omnis\nvoluptate et fuga perferendis voluptas\nillo ratione amet aut et omnis",
    "excerpt" => "asperiores sunt ab assumenda cumque modi velit\nqui",
    "featured_image" => "N/A",
    "slug" => "consequatur-placeat-omnis-quisquam-quia-reprehenderit-fugit-veritatis-facere",
    "title" => "consequatur placeat omnis quisquam quia reprehenderit fugit veritatis facere",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ab nemo optio odio\ndelectus tenetur corporis similique nobis repellendus rerum omnis facilis\nvero blanditiis debitis in nesciunt doloribus dicta dolores\nmagnam minus velit",
    "excerpt" => "ab nemo optio odio\ndelectus tenetur corporis similique",
    "featured_image" => "N/A",
    "slug" => "voluptatem-doloribus-consectetur-est-ut-ducimus",
    "title" => "voluptatem doloribus consectetur est ut ducimus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "enim aspernatur illo distinctio quae praesentium\nbeatae alias amet delectus qui voluptate distinctio\nodit sint accusantium autem omnis\nquo molestiae omnis ea eveniet optio",
    "excerpt" => "enim aspernatur illo distinctio quae praesentium\nbeatae alias",
    "featured_image" => "N/A",
    "slug" => "beatae-enim-quia-vel",
    "title" => "beatae enim quia vel",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "enim adipisci aspernatur nemo\nnumquam omnis facere dolorem dolor ex quis temporibus incidunt\nab delectus culpa quo reprehenderit blanditiis asperiores\naccusantium ut quam in voluptatibus voluptas ipsam dicta",
    "excerpt" => "enim adipisci aspernatur nemo\nnumquam omnis facere dolorem",
    "featured_image" => "N/A",
    "slug" => "voluptas-blanditiis-repellendus-animi-ducimus-error-sapiente-et-suscipit",
    "title" => "voluptas blanditiis repellendus animi ducimus error sapiente et suscipit",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "id velit blanditiis\neum ea voluptatem\nmolestiae sint occaecati est eos perspiciatis\nincidunt a error provident eaque aut aut qui",
    "excerpt" => "id velit blanditiis\neum ea voluptatem\nmolestiae sint",
    "featured_image" => "N/A",
    "slug" => "et-fugit-quas-eum-in-in-aperiam-quod",
    "title" => "et fugit quas eum in in aperiam quod",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "voluptatibus ex esse\nsint explicabo est aliquid cumque adipisci fuga repellat labore\nmolestiae corrupti ex saepe at asperiores et perferendis\nnatus id esse incidunt pariatur",
    "excerpt" => "voluptatibus ex esse\nsint explicabo est aliquid cumque",
    "featured_image" => "N/A",
    "slug" => "consequatur-id-enim-sunt-et-et",
    "title" => "consequatur id enim sunt et et",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "officia veritatis tenetur vero qui itaque\nsint non ratione\nsed et ut asperiores iusto eos molestiae nostrum\nveritatis quibusdam et nemo iusto saepe",
    "excerpt" => "officia veritatis tenetur vero qui itaque\nsint non",
    "featured_image" => "N/A",
    "slug" => "repudiandae-ea-animi-iusto",
    "title" => "repudiandae ea animi iusto",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "reprehenderit id nostrum\nvoluptas doloremque pariatur sint et accusantium quia quod aspernatur\net fugiat amet\nnon sapiente et consequatur necessitatibus molestiae",
    "excerpt" => "reprehenderit id nostrum\nvoluptas doloremque pariatur sint et",
    "featured_image" => "N/A",
    "slug" => "aliquid-eos-sed-fuga-est-maxime-repellendus",
    "title" => "aliquid eos sed fuga est maxime repellendus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "magnam molestiae perferendis quisquam\nqui cum reiciendis\nquaerat animi amet hic inventore\nea quia deleniti quidem saepe porro velit",
    "excerpt" => "magnam molestiae perferendis quisquam\nqui cum reiciendis\nquaerat",
    "featured_image" => "N/A",
    "slug" => "odio-quis-facere-architecto-reiciendis-optio",
    "title" => "odio quis facere architecto reiciendis optio",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "officiis error culpa consequatur modi asperiores et\ndolorum assumenda voluptas et vel qui aut vel rerum\nvoluptatum quisquam perspiciatis quia rerum consequatur totam quas\nsequi commodi repudiandae asperiores et saepe a",
    "excerpt" => "officiis error culpa consequatur modi asperiores et\ndolorum",
    "featured_image" => "N/A",
    "slug" => "fugiat-quod-pariatur-odit-minima",
    "title" => "fugiat quod pariatur odit minima",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "sunt repellendus quae\nest asperiores aut deleniti esse accusamus repellendus quia aut\nquia dolorem unde\neum tempora esse dolore",
    "excerpt" => "sunt repellendus quae\nest asperiores aut deleniti esse",
    "featured_image" => "N/A",
    "slug" => "voluptatem-laborum-magni",
    "title" => "voluptatem laborum magni",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "occaecati a doloribus\niste saepe consectetur placeat eum voluptate dolorem et\nqui quo quia voluptas\nrerum ut id enim velit est perferendis",
    "excerpt" => "occaecati a doloribus\niste saepe consectetur placeat eum",
    "featured_image" => "N/A",
    "slug" => "et-iusto-veniam-et-illum-aut-fuga",
    "title" => "et iusto veniam et illum aut fuga",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "quam occaecati qui deleniti consectetur\nconsequatur aut facere quas exercitationem aliquam hic voluptas\nneque id sunt ut aut accusamus\nsunt consectetur expedita inventore velit",
    "excerpt" => "quam occaecati qui deleniti consectetur\nconsequatur aut facere",
    "featured_image" => "N/A",
    "slug" => "sint-hic-doloribus-consequatur-eos-non-id",
    "title" => "sint hic doloribus consequatur eos non id",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "voluptatem cumque tenetur consequatur expedita ipsum nemo quia explicabo\naut eum minima consequatur\ntempore cumque quae est et\net in consequuntur voluptatem voluptates aut",
    "excerpt" => "voluptatem cumque tenetur consequatur expedita ipsum nemo quia",
    "featured_image" => "N/A",
    "slug" => "consequuntur-deleniti-eos-quia-temporibus-ab-aliquid-at",
    "title" => "consequuntur deleniti eos quia temporibus ab aliquid at",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "odit qui et et necessitatibus sint veniam\nmollitia amet doloremque molestiae commodi similique magnam et quam\nblanditiis est itaque\nquo et tenetur ratione occaecati molestiae tempora",
    "excerpt" => "odit qui et et necessitatibus sint veniam\nmollitia",
    "featured_image" => "N/A",
    "slug" => "enim-unde-ratione-doloribus-quas-enim-ut-sit-sapiente",
    "title" => "enim unde ratione doloribus quas enim ut sit sapiente",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "commodi non non omnis et voluptas sit\nautem aut nobis magnam et sapiente voluptatem\net laborum repellat qui delectus facilis temporibus\nrerum amet et nemo voluptate expedita adipisci error dolorem",
    "excerpt" => "commodi non non omnis et voluptas sit\nautem",
    "featured_image" => "N/A",
    "slug" => "dignissimos-eum-dolor-ut-enim-et-delectus-in",
    "title" => "dignissimos eum dolor ut enim et delectus in",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ut animi facere\ntotam iusto tempore\nmolestiae eum aut et dolorem aperiam\nquaerat recusandae totam odio",
    "excerpt" => "ut animi facere\ntotam iusto tempore\nmolestiae eum",
    "featured_image" => "N/A",
    "slug" => "doloremque-officiis-ad-et-non-perferendis",
    "title" => "doloremque officiis ad et non perferendis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "modi ut in nulla repudiandae dolorum nostrum eos\naut consequatur omnis\nut incidunt est omnis iste et quam\nvoluptates sapiente aliquam asperiores nobis amet corrupti repudiandae provident",
    "excerpt" => "modi ut in nulla repudiandae dolorum nostrum eos",
    "featured_image" => "N/A",
    "slug" => "necessitatibus-quasi-exercitationem-odio",
    "title" => "necessitatibus quasi exercitationem odio",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "nobis facilis odit tempore cupiditate quia\nassumenda doloribus rerum qui ea\nillum et qui totam\naut veniam repellendus",
    "excerpt" => "nobis facilis odit tempore cupiditate quia\nassumenda doloribus",
    "featured_image" => "N/A",
    "slug" => "quam-voluptatibus-rerum-veritatis",
    "title" => "quam voluptatibus rerum veritatis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "libero accusantium et et facere incidunt sit dolorem\nnon excepturi qui quia sed laudantium\nquisquam molestiae ducimus est\nofficiis esse molestiae iste et quos",
    "excerpt" => "libero accusantium et et facere incidunt sit dolorem",
    "featured_image" => "N/A",
    "slug" => "pariatur-consequatur-quia-magnam-autem-omnis-non-amet",
    "title" => "pariatur consequatur quia magnam autem omnis non amet",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ex quod dolorem ea eum iure qui provident amet\nquia qui facere excepturi et repudiandae\nasperiores molestias provident\nminus incidunt vero fugit rerum sint sunt excepturi provident",
    "excerpt" => "ex quod dolorem ea eum iure qui provident",
    "featured_image" => "N/A",
    "slug" => "labore-in-ex-et-explicabo-corporis-aut-quas",
    "title" => "labore in ex et explicabo corporis aut quas",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "facere qui nesciunt est voluptatum voluptatem nisi\nsequi eligendi necessitatibus ea at rerum itaque\nharum non ratione velit laboriosam quis consequuntur\nex officiis minima doloremque voluptas ut aut",
    "excerpt" => "facere qui nesciunt est voluptatum voluptatem nisi\nsequi",
    "featured_image" => "N/A",
    "slug" => "tempora-rem-veritatis-voluptas-quo-dolores-vero",
    "title" => "tempora rem veritatis voluptas quo dolores vero",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "ut libero sit aut totam inventore sunt\nporro sint qui sunt molestiae\nconsequatur cupiditate qui iste ducimus adipisci\ndolor enim assumenda soluta laboriosam amet iste delectus hic",
    "excerpt" => "ut libero sit aut totam inventore sunt\nporro",
    "featured_image" => "N/A",
    "slug" => "laudantium-voluptate-suscipit-sunt-enim-enim",
    "title" => "laudantium voluptate suscipit sunt enim enim",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "est molestiae facilis quis tempora numquam nihil qui\nvoluptate sapiente consequatur est qui\nnecessitatibus autem aut ipsa aperiam modi dolore numquam\nreprehenderit eius rem quibusdam",
    "excerpt" => "est molestiae facilis quis tempora numquam nihil qui",
    "featured_image" => "N/A",
    "slug" => "odit-et-voluptates-doloribus-alias-odio-et",
    "title" => "odit et voluptates doloribus alias odio et",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "sint molestiae magni a et quos\neaque et quasi\nut rerum debitis similique veniam\nrecusandae dignissimos dolor incidunt consequatur odio",
    "excerpt" => "sint molestiae magni a et quos\neaque et",
    "featured_image" => "N/A",
    "slug" => "optio-ipsam-molestias-necessitatibus-occaecati-facilis-veritatis-dolores-aut",
    "title" => "optio ipsam molestias necessitatibus occaecati facilis veritatis dolores aut",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "similique sed nisi voluptas iusto omnis\nmollitia et quo\nassumenda suscipit officia magnam sint sed tempora\nenim provident pariatur praesentium atque animi amet ratione",
    "excerpt" => "similique sed nisi voluptas iusto omnis\nmollitia et",
    "featured_image" => "N/A",
    "slug" => "dolore-veritatis-porro-provident-adipisci-blanditiis-et-sunt",
    "title" => "dolore veritatis porro provident adipisci blanditiis et sunt",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "quasi excepturi consequatur iste autem temporibus sed molestiae beatae\net quaerat et esse ut\nvoluptatem occaecati et vel explicabo autem\nasperiores pariatur deserunt optio",
    "excerpt" => "quasi excepturi consequatur iste autem temporibus sed molestiae",
    "featured_image" => "N/A",
    "slug" => "placeat-quia-et-porro-iste",
    "title" => "placeat quia et porro iste",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eos et molestiae\nnesciunt ut a\ndolores perspiciatis repellendus repellat aliquid\nmagnam sint rem ipsum est",
    "excerpt" => "eos et molestiae\nnesciunt ut a\ndolores perspiciatis",
    "featured_image" => "N/A",
    "slug" => "nostrum-quis-quasi-placeat",
    "title" => "nostrum quis quasi placeat",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "consequatur omnis est praesentium\nducimus non iste\nneque hic deserunt\nvoluptatibus veniam cum et rerum sed",
    "excerpt" => "consequatur omnis est praesentium\nducimus non iste\nneque",
    "featured_image" => "N/A",
    "slug" => "sapiente-omnis-fugit-eos",
    "title" => "sapiente omnis fugit eos",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "repellat aut aperiam totam temporibus autem et\narchitecto magnam ut\nconsequatur qui cupiditate rerum quia soluta dignissimos nihil iure\ntempore quas est",
    "excerpt" => "repellat aut aperiam totam temporibus autem et\narchitecto",
    "featured_image" => "N/A",
    "slug" => "sint-soluta-et-vel-magnam-aut-ut-sed-qui",
    "title" => "sint soluta et vel magnam aut ut sed qui",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "minus omnis soluta quia\nqui sed adipisci voluptates illum ipsam voluptatem\neligendi officia ut in\neos soluta similique molestias praesentium blanditiis",
    "excerpt" => "minus omnis soluta quia\nqui sed adipisci voluptates",
    "featured_image" => "N/A",
    "slug" => "ad-iusto-omnis-odit-dolor-voluptatibus",
    "title" => "ad iusto omnis odit dolor voluptatibus",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "libero voluptate eveniet aperiam sed\nsunt placeat suscipit molestias\nsimilique fugit nam natus\nexpedita consequatur consequatur dolores quia eos et placeat",
    "excerpt" => "libero voluptate eveniet aperiam sed\nsunt placeat suscipit",
    "featured_image" => "N/A",
    "slug" => "aut-amet-sed",
    "title" => "aut amet sed",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "aut et excepturi dicta laudantium sint rerum nihil\nlaudantium et at\na neque minima officia et similique libero et\ncommodi voluptate qui",
    "excerpt" => "aut et excepturi dicta laudantium sint rerum nihil",
    "featured_image" => "N/A",
    "slug" => "ratione-ex-tenetur-perferendis",
    "title" => "ratione ex tenetur perferendis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "dolorem quibusdam ducimus consequuntur dicta aut quo laboriosam\nvoluptatem quis enim recusandae ut sed sunt\nnostrum est odit totam\nsit error sed sunt eveniet provident qui nulla",
    "excerpt" => "dolorem quibusdam ducimus consequuntur dicta aut quo laboriosam",
    "featured_image" => "N/A",
    "slug" => "beatae-soluta-recusandae",
    "title" => "beatae soluta recusandae",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "aspernatur expedita soluta quo ab ut similique\nexpedita dolores amet\nsed temporibus distinctio magnam saepe deleniti\nomnis facilis nam ipsum natus sint similique omnis",
    "excerpt" => "aspernatur expedita soluta quo ab ut similique\nexpedita",
    "featured_image" => "N/A",
    "slug" => "qui-qui-voluptates-illo-iste-minima",
    "title" => "qui qui voluptates illo iste minima",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "earum voluptatem facere provident blanditiis velit laboriosam\npariatur accusamus odio saepe\ncumque dolor qui a dicta ab doloribus consequatur omnis\ncorporis cupiditate eaque assumenda ad nesciunt",
    "excerpt" => "earum voluptatem facere provident blanditiis velit laboriosam\npariatur",
    "featured_image" => "N/A",
    "slug" => "id-minus-libero-illum-nam-ad-officiis",
    "title" => "id minus libero illum nam ad officiis",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut",
    "excerpt" => "in non odio excepturi sint eum\nlabore voluptates",
    "featured_image" => "N/A",
    "slug" => "quaerat-velit-veniam-amet-cupiditate-aut-numquam-ut-sequi",
    "title" => "quaerat velit veniam amet cupiditate aut numquam ut sequi",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "eum non blanditiis soluta porro quibusdam voluptas\nvel voluptatem qui placeat dolores qui velit aut\nvel inventore aut cumque culpa explicabo aliquid at\nperspiciatis est et voluptatem dignissimos dolor itaque sit nam",
    "excerpt" => "eum non blanditiis soluta porro quibusdam voluptas\nvel",
    "featured_image" => "N/A",
    "slug" => "quas-fugiat-ut-perspiciatis-vero-provident",
    "title" => "quas fugiat ut perspiciatis vero provident",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "doloremque ex facilis sit sint culpa\nsoluta assumenda eligendi non ut eius\nsequi ducimus vel quasi\nveritatis est dolores",
    "excerpt" => "doloremque ex facilis sit sint culpa\nsoluta assumenda",
    "featured_image" => "N/A",
    "slug" => "laboriosam-dolor-voluptates",
    "title" => "laboriosam dolor voluptates",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "quo deleniti praesentium dicta non quod\naut est molestias\nmolestias et officia quis nihil\nitaque dolorem quia",
    "excerpt" => "quo deleniti praesentium dicta non quod\naut est",
    "featured_image" => "N/A",
    "slug" => "temporibus-sit-alias-delectus-eligendi-possimus-magni",
    "title" => "temporibus sit alias delectus eligendi possimus magni",
    "author_id" => author.id,
    "published" => true
  },
  %{
    "content" =>
      "cupiditate quo est a modi nesciunt soluta\nipsa voluptas error itaque dicta in\nautem qui minus magnam et distinctio eum\naccusamus ratione error aut",
    "excerpt" => "cupiditate quo est a modi nesciunt soluta\nipsa",
    "featured_image" => "N/A",
    "slug" => "at-nam-consequatur-ea-labore-ea-harum",
    "title" => "at nam consequatur ea labore ea harum",
    "author_id" => author.id,
    "published" => true
  }
]

tags = [
  %Tag{name: "programing"},
  %Tag{name: "phoenix"},
  %Tag{name: "ecto"}
]

created_tags = Enum.map(tags, &Repo.insert!/1)

Enum.each(posts, fn post ->
  changeset = Blog.change_post(%Post{}, post)

  new_changeset =
    changeset
    |> Ecto.Changeset.put_assoc(:tags, created_tags)

  Repo.insert!(new_changeset)
end)
