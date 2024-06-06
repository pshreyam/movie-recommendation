-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2019 at 08:36 AM
-- Server version: 5.7.24-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recomovies`
--

-- --------------------------------------------------------

--
-- Table structure for table `crime`
--

CREATE TABLE `crime` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crime`
--

INSERT INTO `crime` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('The Godfather', 1972, 'Francis Ford Coppola ', 9.2, 'Marlon Brando as Don Vito Corleone\r\nAl Pacino as Michael Corleone\r\nTalia Shire as Connie\r\nDiane Keaton as Kay Adams', 'The Godfather \"Don\" Vito Corleone is the head of the Corleone mafia family in New York. He is at the event of his daughter\'s wedding. Michael, Vito\'s youngest son and a decorated WW II Marine is also present at the wedding. Michael seems to be uninterested in being a part of the family business. Vito is a powerful man, and is kind to all those who give him respect but is ruthless against those who do not. But when a powerful and treacherous rival wants to sell drugs and needs the Don\'s influence for the same, Vito refuses to do it. What follows is a clash between Vito\'s fading old values and the new ways which may cause Michael to do the thing he was most reluctant in doing and wage a mob war against all the other mafia families which could tear the Corleone family apart.\r\n'),
('The Dark Night', 2008, 'Chistopher Nolan', 9, 'Christian Bale as Bruce Wayne\r\nCillian Murphy as Scarecrow\r\nHeath Ledger as Joker\r\nWilliam Fichtner as Bank Manager', 'Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as \"The Joker\" appears in Gotham, creating a new wave of chaos. Batman\'s struggle against The Joker becomes deeply personal, forcing him to \"confront everything he believes\" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes.\r\n'),
('The Godfather:Part II', 1974, 'Francis Ford Coppola', 9, 'Robert De Niro as Vito Corleone\r\nAl Pacino as Michael\r\nTalia Shire as Connie Corleone\r\nDiane Keaton as Kay', 'The continuing saga of the Corleone crime family tells the story of a young Vito Corleone growing up in Sicily and in 1910s New York; and follows Michael Corleone in the 1950s as he attempts to expand the family business into Las Vegas, Hollywood and Cuba.\r\n'),
('Pulp fiction', 1994, 'Quentin Tarantino ', 8.9, 'Quentin Tarantino as Jimmie Dimmick\r\nBruce Willis as Butch Coolidge\r\nSamuel L. Jackson as Jules Winnfield\r\nJohn Travolta as Vincent Vega', 'Jules Winnfield (Samuel L. Jackson) and Vincent Vega (John Travolta) are two hit men who are out to retrieve a suitcase stolen from their employer, mob boss Marsellus Wallace (Ving Rhames). Wallace has also asked Vincent to take his wife Mia (Uma Thurman) out a few days later when Wallace himself will be out of town. Butch Coolidge (Bruce Willis) is an aging boxer who is paid by Wallace to lose his fight. The lives of these seemingly unrelated people are woven together comprising of a series of funny, bizarre and uncalled-for incidents.\r\n'),
('12 angry men', 1957, 'Sidney Lumet', 8.9, 'Henry Fonda as Juror #8\r\nJack Warden as Juror #7\r\nJack Klugman as Juror #5\r\nE.G. Marshall as Juror #4', 'The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young man is guilty or innocent of murdering his father. What begins as an open-and-shut case of murder soon becomes a detective story that presents a succession of clues creating doubt, and a mini-drama of each of the jurors\' prejudices and preconceptions about the trial, the accused, and each other. Based on the play, all of the action takes place on the stage of the jury room.\r\n'),
('Inception', 2010, 'Christhoper Nolan', 8.8, 'Tom Hardy as Eames\r\nLeonardo DiCaprio as Cobb\r\nJoseph Gordon-Levitt as Arthur\r\nCillian Murphy as Robert Fischer', 'Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb\'s rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible, inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea, but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming.\r\n'),
('Goodfellas', 1990, 'Martin Scorsese', 8.7, 'Robert De Niro as James Conway\r\nSamuel L. Jackson as Stacks Edwards\r\nJoe Pesci as Tommy DeVito\r\nRay Liotta as Henry Hill', 'Henry Hill might be a small time gangster, who may have taken part in a robbery with Jimmy Conway and Tommy De Vito, two other gangsters who might have set their sights a bit higher. His two partners could kill off everyone else involved in the robbery, and slowly start to think about climbing up through the hierarchy of the Mob. Henry, however, might be badly affected by his partners\' success, but will he consider stooping low enough to bring about the downfall of Jimmy and Tommy?\r\n'),
('se7en', 1995, 'David Fincher', 8.6, 'Brad Pitt as Mills\r\nMorgan Freeman as Somerset\r\nKevin Spacey as John Doe\r\nGwyneth Paltrow as Tracy', 'A film about two homicide detectives\' (Morgan Freeman and Brad Pitt) desperate hunt for a serial killer who justifies his crimes as absolution for the world\'s ignorance of the Seven Deadly Sins. The movie takes us from the tortured remains of one victim to the next as the sociopathic \"John Doe\" (Kevin Spacey) sermonizes to Detectives Somerset and Mills -- one sin at a time. The sin of Gluttony comes first and the murderer\'s terrible capacity is graphically demonstrated in the dark and subdued tones characteristic of film noir. The seasoned and cultured but jaded Somerset researches the Seven Deadly Sins in an effort to understand the killer\'s modus operandi while the bright but green and impulsive Detective Mills (Pitt) scoffs at his efforts to get inside the mind of a killer...\r\n'),
('The Green Mile', 1999, 'Frank Darabont', 8.6, 'Tom Hanks as Paul Edgecomb\r\nSam Rockwell as \'Wild Bill\' Wharton\r\nMichael Clarke Duncan as John Coffey\r\nPatricia Clarkson as Melinda Moores', 'Death Row guards at a penitentiary, in the 1930\'s, have a moral dilemma with their job when they discover one of their prisoners, a convicted murderer, has a special gift.\r\n'),
('City of God', 2002, 'Fernando Meirelles', 8.6, 'Alice Braga as Angélica\r\nSeu Jorge as Mané Galinha - Knockout Ned', 'Brazil, 1960s, City of God. The Tender Trio robs motels and gas trucks. Younger kids watch and learn well...too well. 1970s: Li\'l Zé has prospered very well and owns the city. He causes violence and fear as he wipes out rival gangs without mercy. His best friend Bené is the only one to keep him on the good side of sanity. Rocket has watched these two gain power for years, and he wants no part of it. Yet he keeps getting swept up in the madness. All he wants to do is take pictures. 1980s: Things are out of control between the last two remaining gangs...will it ever end? Welcome to the City of God.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `documentary`
--

CREATE TABLE `documentary` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documentary`
--

INSERT INTO `documentary` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('By Here Now', 2015, 'Lilibet Foster', 8.7, 'Jai Courtney', 'As though life is imitating art, actor and sex-symbol, Andy Whitfield, had just become a star as the lead in the hit television series,\'Spartacus,\' when he is faced with his biggest personal challenge - life-threatening cancer. \'Be Here Now\' is a feature documentary that follows him on his dramatic journey to cure himself. Confirmed in matching affirmative tattoos, he and his charismatic wife and their two children, commit to taking Andy\'s healing into their own hands and living life fully, not in the shadows of the disease. Each step tests their limits and strength of character, while revealing their tenderness, humor and determination. And, as each person goes through their own transformations, the film becomes an inspiring and universal story of courage, love and resilience.\r\n'),
('Queen Rock Montreal & Live Aid', 2007, 'Saul Swimmer', 8.7, '', 'The movie contains two concerts of the British rock band Queen. The first concert is their show at Montreal in November 1981. The second concert is their live performance at Live Aid in 1985.\r\n'),
('Human', 2015, 'Yann Arthus-Bertrand', 8.7, '', 'A collection of stories about and images of our world, offering an immersion to the core of what it means to be human.\r\n'),
('Porcupine Tree: Anesthetize', 2010, 'Lasse Hoile', 8.6, '', 'Anesthetize is the second live DVD by progressive rock band Porcupine Tree, released on 20 May 2010. The Blu-ray edition was released on 15 June.\r\n'),
('Baraka', 1992, 'Ron Fricke', 8.6, '', 'Without words, cameras show us the world, with an emphasis not on \"where,\" but on \"what\'s there.\" It begins with morning, natural landscapes and people at prayer: volcanoes, water falls, veldts, and forests; several hundred Balinese Hindu men perform kecak, the monkey chant. Indigenous peoples apply body paint; whole villages dance. The film moves to destruction of nature via logging, blasting, and strip mining. Images of poverty, rapid urban life, and factories give way to war, concentration camps, and mass graves. Ancient ruins come into view, and then a sacred river where pilgrims bathe and funeral pyres burn. Prayer and nature return. A monk rings a huge bell; stars wheel across the sky.\r\n'),
('Nature Owl Power', 2015, 'Lucy Smith', 8.6, '', 'For centuries, the mysterious nighttime lives and uncanny hunting skills of owls have made them fascinating hallmarks of children\'s stories and folk tales the world over. But what actually makes owls so special? Bird trainers Lloyd and Rose Buck and their very special family of owls, eagles, falcons, geese, pigeons, and two newly-hatched barn owls - Luna and Lily - provide a rare opportunity to learn more about these unique birds. Using the latest in camera technology, computer graphics, x-rays and super-sensitive microphones, we can take a brand new look at owls in more detail than ever before. The real stories behind how they hunt, how their vision and hearing works, and how they fly so silently are influencing 21st century technology and design.\r\n'),
('Stop Making Sense', 1984, 'Jonathan Demme', 8.5, 'Bernie Worrell as Keyboards\r\nDavid Byrne as Vocals and Guitar', 'David Byrne walks onto the stage and does a solo \"Psycho Killer.\" Jerry Harrison, Tina Weymouth and Chris Frantz join him for two more songs. The crew is busy, still setting up. Then, three more musicians and two back-up singers join the band. Everybody sings, plays, harmonizes, dances, and runs. They change instruments and clothes. Bryne appears in the Big Suit. The backdrop is often black, but sometimes it displays words, images, or children\'s drawings. The band cooks for 18 songs, the lyrics are clear, the house rocks. In this concert film, the Talking Heads hardly talk, don\'t stop, and always make sense.\r\n'),
('Bo Burnham: what.', 2013, 'Bo Burnham', 8.5, 'Bo Burnham as Himself', 'A musical stand-up comedy show by Bo Burnham, the famous internet musician.\r\n'),
('Journey to the Edge of the Universe', 2008, 'Yavar Abbas', 8.5, 'Sean Pertwee as Narrator', 'A journey through space and time.'),
('Samsara', 2011, 'Ron Fricke', 8.5, '', 'Filmed over nearly five years in twenty-five countries on five continents, and shot on seventy-millimetre film, Samsara transports us to the varied worlds of sacred grounds, disaster zones, industrial complexes, and natural wonders.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `drama`
--

CREATE TABLE `drama` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drama`
--

INSERT INTO `drama` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('The Mountain II', 2016, 'Alper Caglar', 9.3, '', 'DAG II; tells the story of a clandestine special forces squad; call sign \'Storm Bringer\'. Following the events of the first film, Bekir and Oguz, unlikely best friends, have enrolled in the world famous, perpetually grueling Turkish special forces training. Their first mission begins six years later-- to infiltrate the most barbarous area of modern day Iraq for a rescue mission.\r\n'),
('Natsamrat', 2016, 'Mahesh Manjrekar', 9.2, '', 'The film is a tragedy about a veteran theatre actor named Ganpat \"Appa\" Belwalkar (Nana Patekar) who has been the best of his lot during his heyday, garnering fame and fortune acting in plays based on various works, especially William Shakespeare\'s. It is a tragedy of a veteran actor who enjoyed a very vital importance in his life but who becomes the victim of old age alienation and estrangement. The film reveals an intensely tragic fate of an actor who becomes victim of fate and fortune in old age, which is similar to the fate of Lear. Natsamrat suffers the pangs of old age and dishonor inflicted on him by his own children. It is a tragedy of great humanist and actor who succumbs to the ill fate and destiny. In fact, Natsamrat is a story of Ganpatrao Belvalkar, who withstands great suffering after his retirement from stage acting.\r\n'),
('Fight Club', 1999, 'David Fincher', 8.8, 'Brad Pitt as Tyler Durden\r\nJared Leto as Angel Face\r\nHelena Bonham Carter as Marla Singer\r\nEdward Norton as The Narrator', 'A nameless first person narrator (Edward Norton) attends support groups in attempt to subdue his emotional state and relieve his insomniac state. When he meets Marla (Helena Bonham Carter), another fake attendee of support groups, his life seems to become a little more bearable. However when he associates himself with Tyler (Brad Pitt) he is dragged into an underground fight club and soap making scheme. Together the two men spiral out of control and engage in competitive rivalry for love and power. When the narrator is exposed to the hidden agenda of Tyler\'s fight club, he must accept the awful truth that Tyler may not be who he says he is.\r\n'),
('The Phantom of the Opera at the Royal Albert Hall', 2011, 'Nick Morris', 8.8, 'Michael Crawford as The Phantom - Original Company\r\nRamin Karimloo as The Phantom\r\nHadley Fraser as Raoul', 'In 1986, Andrew Lloyd Webber\'s The Phantom of the Opera arrived on the West End stage at Her Majesty\'s Theatre. Fast forward 25 years and Phantom has achieved global success, millions of viewers, a film adaptation in 2004 and a musical sequel. Now viewers have the chance to experience this phenomenal show right from their own screens. Filmed at the Royal Albert Hall, this stunning performance brings the show to a bigger stage and celebrates its role as one of the biggest shows in theatre history, with speeches, performances and appearances by the original cast and some of the show\'s most notable Phantoms, including John Owen-Jones and Colm Wilkinson. Starring Ramin Karimloo and Sierra Boggess, Phantom tells the story of a deformed musical genius who lives in the catacombs of the Paris Opera House. Shunned by society, the Phantom seeks revenge in cruel and often violent acts. The Phantom is in love with chorus girl Christine Daaé and has been secretly training her to replace La ...\r\n'),
('Anand', 1971, 'Hrishikesh Mukherjee', 8.8, 'Amitabh Bachchan as Dr. Bhaskar K. Bannerjee / Babu Moshai', 'Dr Bhaskar Bannerjee is not happy with his profession as he cant save the lives of people dying of illness due to poverty.His Dr friend Kulkarni charges huge for imaginary illness of rich and uses that money to people who cant afford treatment.Things change when Anand a cancer patients enters Bhaskar\'s life Anand is cheerful and believes in spreading happiness to everyone as he knows he is on last stage of cancer and has few months to live.Bhaskar and Anand bond very well Anand also gets Bhaskar\'s love life back on track and Bhaskar doesn\'t want him to loose anymore.As time passes Anand\'s condition starts to deteriorate and everyone around him is just hoping for a miracle.\r\n'),
('One Flew Over the Cuckoo\'s Nest', 1975, 'Milos Forman', 8.7, 'Jack Nicholson as R.P. McMurphy\r\nDanny DeVito as Martini\r\nChristopher Lloyd as Taber\r\nBrad Dourif as Billy Bibbit', 'McMurphy has a criminal past and has once again gotten himself into trouble and is sentenced by the court. To escape labor duties in prison, McMurphy pleads insanity and is sent to a ward for the mentally unstable. Once here, McMurphy both endures and stands witness to the abuse and degradation of the oppressive Nurse Ratched, who gains superiority and power through the flaws of the other inmates. McMurphy and the other inmates band together to make a rebellious stance against the atrocious Nurse.\r\n'),
('It\'s a Wonderful Life', 1946, 'Frank Capra', 8.6, 'James Stewart as George Bailey\r\nDonna Reed as Mary Hatch\r\nGloria Grahame as Violet\r\nThomas Mitchell as Uncle Billy', 'George Bailey has spent his entire life giving of himself to the people of Bedford Falls. He has always longed to travel but never had the opportunity in order to prevent rich skinflint Mr. Potter from taking over the entire town. All that prevents him from doing so is George\'s modest building and loan company, which was founded by his generous father. But on Christmas Eve, George\'s Uncle Billy loses the business\'s $8,000 while intending to deposit it in the bank. Potter finds the misplaced money and hides it from Billy. When the bank examiner discovers the shortage later that night, George realizes that he will be held responsible and sent to jail and the company will collapse, finally allowing Potter to take over the town. Thinking of his wife, their young children, and others he loves will be better off with him dead, he contemplates suicide. But the prayers of his loved ones result in a gentle angel named Clarence coming to earth to help George, with the promise of earning his ...\r\n'),
('Life Is Beautiful', 1997, 'Roberto Benigni', 8.6, 'Roberto Benigni as Guido\r\nRichard Sammel as Ufficiale stanzioncina\r\nHorst Buchholz as Dottor Lessing\r\nGiorgio Cantarini as Giosué', 'In 1930s Italy, a carefree Jewish book keeper named Guido starts a fairy tale life by courting and marrying a lovely woman from a nearby city. Guido and his wife have a son and live happily together until the occupation of Italy by German forces. In an attempt to hold his family together and help his son survive the horrors of a Jewish Concentration Camp, Guido imagines that the Holocaust is a game and that the grand prize for winning is a tank.\r\n'),
('Saving Private Ryan', 1998, 'Steven Spielberg', 8.6, 'Tom Hanks as Captain Miller\r\nMatt Damon as Private Ryan\r\nRyan Hurst as Paratrooper Mandelsohn\r\nVin Diesel as Private Caparzo', 'Opening with the Allied invasion of Normandy on 6 June 1944, members of the 2nd Ranger Battalion under Cpt. Miller fight ashore to secure a beachhead. Amidst the fighting, two brothers are killed in action. Earlier in New Guinea, a third brother is KIA. Their mother, Mrs. Ryan, is to receive all three of the grave telegrams on the same day. The United States Army Chief of Staff, George C. Marshall, is given an opportunity to alleviate some of her grief when he learns of a fourth brother, Private James Ryan, and decides to send out 8 men (Cpt. Miller and select members from 2nd Rangers) to find him and bring him back home to his mother...\r\n'),
('City of God', 2002, 'Fernando Meirelles', 8.6, 'Alice Braga as Angélica\r\nSeu Jorge as Mané Galinha - Knockout Ned', 'Brazil, 1960s, City of God. The Tender Trio robs motels and gas trucks. Younger kids watch and learn well...too well. 1970s: Li\'l Zé has prospered very well and owns the city. He causes violence and fear as he wipes out rival gangs without mercy. His best friend Bené is the only one to keep him on the good side of sanity. Rocket has watched these two gain power for years, and he wants no part of it. Yet he keeps getting swept up in the madness. All he wants to do is take pictures. 1980s: Things are out of control between the last two remaining gangs...will it ever end? Welcome to the City of God.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('American Sniper', 2014, 'Clint Eastwood', 7.4, 'Sienna Miller，Kyle Gallner，Bradley Cooper', 'The movie expressed a story about a Navy S.E.A.L. sniper who had set up his legend due to saving thousand lives on the every battlefield he joined. His name is Chris Kyle. His wife and children are waiting after tours of tasks. however, Chris has found his real life’s purpose.\r\n'),
('Gandhi', 1982, 'Richard Attenborough', 8, 'Ben Kingsley，John Gielgud，Candice Bergen\r\n', 'In this biographical drama from director Richard Attenborough, Ben Kingsley stars as Mahatma Gandhi, Indian political and spiritual leader, who take up the fight for India\'s independence from the British Empire. Faced with armed resistance from the British government, Gandhi adopts a policy of \"passive resistance,\" endeavoring to win freedom for his people without resorting to bloodshed.\r\n'),
('Airlift', 2016, 'Raja Menon', 9, 'Akshay Kumar，Nimrat Kaur，Taranjit Kaur\r\n', 'This Bollywood action drama stars Akshay Kumar as Ranjit Katyal, a wealthy and powerful Indian businessman, who has spent almost all his life living in Kuwait. When the Iraqi military troops invades Kuwait, Ranjit unknowingly becomes the man who all 1,70,000 Indians look up to for getting them out safely from Kuwait.\r\n'),
('Sarbjit', 2016, 'Omung Kumar', 7.4, 'Randeep Hooda，Aishwarya Rai Bachchan，Richa Chadha\r\n', 'In 1990, after becoming drunk, Sarbjit accidentally crosses the border and arrives in Pakistan, where he is convicted as an Indian spy and sentenced to capital punishment. His sister has spent 23 years fighting to clear his name.\r\n'),
('Thirteen Days', 2000, 'Roger Donaldson', 7.3, 'Kevin Costner，Bruce Greenwood，Shawn Driscoll\r\n', 'In the early days of October 1962, U.S. spy planes photograph the impending installation of Soviet missile sites in Cuba. While there is widespread agreement that the missiles must not be allowed, there is no clear way to ensure that. The military feels that their destruction followed by the invasion of Cuba is likely the only option.\r\n'),
('Milk', 2008, 'Gus Van Sant', 7.6, 'Sean Penn，Josh Brolin，Emile Hirsch', 'The film tells the story of gay rights activist and politician Harvey Milk, who is the first openly gay person to be elected to public office in California. The following year, both he and the citys mayor George Moscone are shot to death by another city supervisor, Dan White.\r\n'),
('Riot', 2018, 'Jeffrey Walker', 6.9, 'Damon Herriman，Kate Box，Xavier Samuel', 'Inspired by actual events during Australia’s 1970s Gay Rights Movement, Riot explores the origins of the activism that led to the world\'s first Gay and Lesbian Mardi Gras.\r\n'),
('An Adventure in Space and Time', 2013, 'Terry McDonough', 8.3, 'David Bradley，Ross Gurney-Randall，Roger May\r\n', 'A television legend was made when the first episode of Doctor Who was broadcast on BBC One in 1963. Fifty years later, it is retold in a new BBC AMERICA film to celebrate the 50th anniversary of the franchise.\r\n'),
('Downfall', 2004, 'Oliver Hirschbiegel ', 8.2, 'Bruno Ganz，Alexandra Maria Lara，Ulrich Matthes\r\n', 'The movie tells a life story of a very special woman Traudl Junge, 22 years old, a fresh-faced girl from Munich, who is chosen to work beside Adolf Hitler, one of the most powerful and dangerous man on the world. In this film, she will tell about the Nazi dictator’s last days in his Berlin bunker at the end of World War ll.\r\n'),
('Kama Sutra: A Tale of Love', 1996, 'Mira Nair', 6, 'Naveen Andrews，Sarita Choudhury，Indira Varma\r\n', 'This erotic drama tells the seductive tale of betrayal and sexual intrigue to be found within the confines of a great Indian palace. Maya, the beautiful servant girl becomes defiant, rebelling against ancient tradition. As passion takes over, the conflict brings consequences that no one ever envisioned.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `horror`
--

CREATE TABLE `horror` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `horror`
--

INSERT INTO `horror` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('The Predator', 2018, 'Shane Black', 7.6, 'Boyd Holbrook\r\nTrevante Rhodes\r\nJacob Tremblay\r\nOlivia Munn', 'From the outer reaches of space to the small-town streets of suburbia, the hunt comes home. Now, the universe’s most lethal hunters are stronger, smarter and deadlier than ever before, having genetically upgraded themselves with DNA from other species. When a young boy accidentally triggers their return to Earth, only a ragtag crew of ex-soldiers and a disgruntled science teacher can prevent the end of the human race.\r\n'),
('Wilding', 2018, 'Fritz Böhm', 8.4, 'Bel Powley\r\nLiv Tyler\r\nBrad Dourif\r\nTroy Ruptash', 'A young woman held in captivity discovers the realities of truth and lies in the outside world.\r\n'),
('Never Hike Alone', 2017, 'Vincente DiSanti', 7.7, 'Drew Leighty\r\nVincente DiSanti', 'A hiker’s survival skills is put to the test when he stumbles upon the remains of an old abandoned camp and discovers its long dark secrets.\r\n'),
('Dismissed', 2017, ' Benjamin Arfmann', 8.9, 'Dylan Sprouse\r\nRandall Park\r\nBrooke Dillman\r\nRae Gray\r\nMatthew J. Evans', 'A straight-edged teacher finds trouble when an honors student is willing to do anything to get an A.\r\n'),
('The Conjuring 2', 2015, 'James Wan', 7.4, 'Patrick Wilson\r\nVera Farmiga\r\nMadison Wolfe\r\nFrances O\'Connor\r\nLauren Esposito', 'Lorraine and Ed Warren travel to north London to help a single mother raising four children alone in a house plagued by malicious spirits.\r\n'),
('Get Out', 2017, 'Jordan Peele', 7.7, 'Daniel Kaluuya\r\nAllison Williams\r\nBradley Whitford\r\nCatherine Keener\r\nKeith Stanfield\r\nBetty Gabriel', 'Chris and his girlfriend Rose go upstate to visit her parents for the weekend. At first, Chris reads the family’s overly accommodating behavior as nervous attempts to deal with their daughter’s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined.\r\n'),
('Delirium', 2018, 'Johnny Martin', 0, 'Mike C. Manning\r\nGriffin Freeman\r\nRyan Pinkston\r\nLindsay Bushman\r\nNia Bois', 'A group of young men dare a classmate to reach the porch of a legendary old house, said to be haunted by the thirteen victims of a family massacre. In hopes of making a viral video they arm him with a video camera to prove he was there or to capture him fleeing in terror before even reaching the house, as others have. When he doesn’t return, the guys must go in to get him. Inside they discover the truth about the house, the fate of their friend and their own fate as well.\r\n'),
('Shed of the Dead', 2019, 'Drew Cullingham', 5.5, 'Brian Blessed\r\nSpencer Brown\r\nEwen MacIntosh\r\nKane Hodder\r\nLauren Socha\r\nEmily Booth', 'Trevor is ‘between jobs’. He spends his days avoiding his nagging heifer of a wife by hiding out in his allotment shed and painting figurines for his wargames with his agoraphobic friend, Graham, and dreaming of his heroic alter-ego, the battle mage Casimir the Destroyer. When Mr Parsons, one of the other allotment tenants, petitions to have Trevor removed from his disgrace of a plot (he’s not there to grow stuff!) an argument ensues that leaves Trevor with a corpse to hide. Unfortunately, this untimely accident coincides with the zombie apocalypse and Mr Parsons’ return is just the beginnings of Trevor’s problems. More pressing is whether or not he should try and save his wife and her beautiful best friend, who both he and Graham have a thing for.\r\n'),
('The Conjuring', 2013, 'James Wan', 7.5, 'Ron Livingston\r\nLili Taylor\r\nVera Farmiga\r\nPatrick Wilson', 'In 1971, the Perron including Roger Perron, his wife Carolyn and their five daughters Andrea, Nancy, Christine, Cindy, and April move into a dilapidated farmhouse in Harrisville, Rhode Island. Right after their move, some mysterious events happen, which threaten the family so they ask for help from paranormal investigators Ed and Lorraine Warren.\r\n'),
('Repulsion', 1965, 'Roman Polanski', 7.8, 'Catherine Deneuve\r\nYvonne Furneaux\r\nIan Hendry\r\nJohn Fraser', 'A story about a young girl who live alone in a cold house when her sister traveled. A young girl must face with disgusting thing. What will happen with this young girl.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `musical`
--

CREATE TABLE `musical` (
  `moviename` varchar(70) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `musical`
--

INSERT INTO `musical` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('The Phantom of the Opera at the Royal Albert Hall', 2011, 'Nick Morris', 8.8, 'Michael Crawford \r\nRamin Karimloo \r\nHadley Fraser ', 'In 1986, Andrew Lloyd Webber\'s The Phantom of the Opera arrived on the West End stage at Her Majesty\'s Theatre. Fast forward 25 years and Phantom has achieved global success, millions of viewers, a film adaptation in 2004 and a musical sequel. Now viewers have the chance to experience this phenomenal show right from their own screens. Filmed at the Royal Albert Hall, this stunning performance brings the show to a bigger stage and celebrates its role as one of the biggest shows in theatre history, with speeches, performances and appearances by the original cast and some of the show\'s most notable Phantoms, including John Owen-Jones and Colm Wilkinson. Starring Ramin Karimloo and Sierra Boggess, Phantom tells the story of a deformed musical genius who lives in the catacombs of the Paris Opera House. Shunned by society, the Phantom seeks revenge in cruel and often violent acts. \r\n'),
('The Lion King', 1994, 'Rob Minkoff', 8.5, 'Jonathan Taylor Thomas\r\nJames Earl Jones \r\nJeremy Irons \r\nMatthew Broderick', 'A young lion prince is cast out of his pride by his cruel uncle, who claims he killed his father. While the uncle rules with an iron paw, the prince grows up beyond the Savannah, living by a philosophy: No worries for the rest of your days. But when his past comes to haunt him, the young prince must decide his fate: Will he remain an outcast or face his demons and become what he needs to be?\r\n'),
('How the Grinch Stole Christmas!', 1966, 'Chuck Jones', 8.4, 'Boris Karloff\r\nJune Foray\r\nThurl Ravenscroft \r\nDal McKennon', 'Bitter and hateful, the Grinch is irritated at the thought of the nearby village having a happy time celebrating Christmas. So disguised as Santa Claus, with his dog made to look like a reindeer, he raids the village to steal all the Christmas things. The village is sure to have a sad Christmas this year.\r\n'),
('Singin\' in the Rain', 1952, 'Stanley Donen', 8.3, 'Debbie Reynolds \r\nRita Moreno\r\nGene Kelly\r\nLana Turner ', '1927 Hollywood. Monumental Pictures\' biggest stars, glamorous on-screen couple Lina Lamont and Don Lockwood, are also an off-screen couple if the trade papers and gossip columns are to be believed. Both perpetuate the public perception if only to please their adoring fans and bring people into the movie theaters. In reality, Don barely tolerates her, while Lina, despite thinking Don beneath her, simplemindedly believes what she sees on screen in order to bolster her own stardom and sense of self-importance. R.F. Simpson, Monumental\'s head, dismisses what he thinks is a flash in the pan: talking pictures. It isn\'t until The Jazz Singer (1927) becomes a bona fide hit which results in all the movie theaters installing sound equipment that R.F. knows Monumental, most specifically in the form of Don and Lina, have to jump on the talking picture bandwagon, despite no one at the studio knowing anything about the technology.\r\n'),
('The Red Shoes', 1948, 'Michael Powell', 8.3, 'Leslie Phillips\r\nPatrick Troughton\r\nRobert Helpmann \r\nMoira Shearer', 'Under the authoritarian rule of charismatic ballet impressario Boris Lermontov, his proteges realize the full promise of their talents, but at a price: utter devotion to their art and complete loyalty to Lermontov himself. Under his near-obsessive guidance, young ballerina Victoria Page is poised for superstardom, but earns Lermontov\'s scorn when she falls in love with Julian Craster, composer of \"The Red Shoes,\" the ballet Lermontov is staging to showcase her talents. Vicky leaves the company and marries Craster, but still finds herself torn between Lermontov\'s demands and those of her heart.\r\n'),
('Sholay', 1975, 'Ramesh Sippy', 8.2, 'Amitabh Bachchan\r\nDharmendra\r\nHema Malini\r\nJaya Bahaduri', 'Sholay means embers in Hindi. In this particular movie, a Police Officer, who\'s family was killed by a bandit named Gabbar Singh, decides to fight fire with fire and recruits two convicts, Jai and Veeru to capture Gabbar. He approaches them in jail, puts the proposal in front of them, and they agree to bring in Gabbar Singh alive - for a hefty price. After their discharge from jail, they travel by train to the village where the Police Officer lives - now with only his widowed daughter-in-law. The three band together to fight one of the most elusive and dreaded bandits of all time. Will the two ex-cons be able to bring Gabbar alive to the Police Officer?\r\n'),
('Miss Saigon: 25th Anniversary', 2016, 'Brett Sullivan', 8.1, 'Jonathan Pryce \r\nLea Salonga', 'A filmed production of the musical \'Miss Saigon\' for its 25th anniversary, performed live at London\'s Prince Edward Theatre, in London\'s West End. Including the 2hr 20minute production and a bonus 35-minute \"25th Anniversary Gala\" which included stars of the original cast, Jonathan Pryce, Lea Salonga and Simon Bowman.\r\n'),
('Rudolph the Red-Nosed Reindeer', 1964, 'Larry Roemer', 8.1, 'Larry Roemer\r\nPaul Soles\r\nCorinne Conley \r\nLarry D. Mann', 'Sam the snowman tells us the story of a young red-nosed reindeer who, after being ousted from the reindeer games because of his beaming honker, teams up with Hermey, an elf who wants to be a dentist, and Yukon Cornelius, the prospector. They run into the Abominable Snowman and find a whole island of misfit toys. Rudolph vows to see if he can get Santa to help the toys, and he goes back to the North Pole on Christmas Eve. But Santa\'s sleigh is fogged in.\r\n'),
('Aladdin', 1992, 'Ron Clements', 8, 'Robin Williams \r\nJim Cummings \r\nScott Weinger\r\nFrank Welker ', 'Aladdin is a poor street urchin who spends his time stealing food from the marketplace in the city of Agrabah. His adventures begin when he meets a young girl who happens to be Princess Jasmine, who is forced to be married by her wacky yet estranged father. Aladdin\'s luck suddenly changes when he retrieves a magical lamp from the Cave of Wonders. What he unwittingly gets is a fun-loving genie who only wishes to have his freedom. Little do they know is that the Sultan\'s sinister advisor Jafar has his own plans for both Aladdin and the lamp.\r\n'),
('Beauty and the Beast', 1991, 'Gary Trousdale', 8, 'Angela Lansbury \r\nKimmy Robertson \r\nBradley Pierce\r\nRobby Benson', 'Having lived a life in selfishness, a young prince is cursed by a mysterious enchantress to having the appearance of a monstrous beast. His only hope is to learn to love a young woman and earn her love in return in order to redeem himself. Years later, his chance shows itself when a young maiden named Belle offers to take her ill father\'s place as his prisoner. With help from the castle\'s enchanted staff, Belle learns to appreciate her captor and immediately falls in love with him. Back in the village however, an unscrupulous hunter has his own plans for Belle.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `romance`
--

CREATE TABLE `romance` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `romance`
--

INSERT INTO `romance` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('Forrest Gump', 1994, 'Robert Zemeckis', 8.8, 'Tom Hanks\r\nRobin Wright\r\nKurt Russell\r\nHaley Joel Osment', ' Forrest Gump is a simple man with a low I.Q. but good intentions. He is running through childhood with his best and only friend Jenny. His \'mama\' teaches him the ways of life and leaves him to choose his destiny. Forrest joins the army for service in Vietnam, finding new friends called Dan and Bubba, he wins medals, creates a famous shrimp fishing fleet, inspires people to jog, starts a ping-pong craze, creates the smiley, writes bumper stickers and songs, donates to people and meets the president several times. However, this is all irrelevant to Forrest who can only think of his childhood sweetheart Jenny Curran, who has messed up her life. Although in the end all he wants to prove is that anyone can love anyone.\r\n'),
('The Phantom of the Opera at the Royal Albert Hall', 2011, 'Nick Morris', 8.8, 'Michael Crawford \r\nRamin Karimloo\r\nHadley Fraser', 'In 1986, Andrew Lloyd Webber\'s The Phantom of the Opera arrived on the West End stage at Her Majesty\'s Theatre. Fast forward 25 years and Phantom has achieved global success, millions of viewers, a film adaptation in 2004 and a musical sequel. Now viewers have the chance to experience this phenomenal show right from their own screens. Filmed at the Royal Albert Hall, this stunning performance brings the show to a bigger stage and celebrates its role as one of the biggest shows in theatre history, with speeches, performances and appearances by the original cast and some of the show\'s most notable Phantoms, including John Owen-Jones and Colm Wilkinson. Starring Ramin Karimloo and Sierra Boggess, Phantom tells the story of a deformed musical genius who lives in the catacombs of the Paris Opera House. Shunned by society, the Phantom seeks revenge in cruel and often violent acts.\r\n'),
('It\'s a Wonderful Life', 1946, 'Frank Capra', 8.6, 'James Stewart \r\nDonna Reed \r\nGloria Grahame\r\nThomas Mitchell', 'George Bailey has spent his entire life giving of himself to the people of Bedford Falls. He has always longed to travel but never had the opportunity in order to prevent rich skinflint Mr. Potter from taking over the entire town. All that prevents him from doing so is George\'s modest building and loan company, which was founded by his generous father. But on Christmas Eve, George\'s Uncle Billy loses the business\'s $8,000 while intending to deposit it in the bank. Potter finds the misplaced money and hides it from Billy. When the bank examiner discovers the shortage later that night, George realizes that he will be held responsible and sent to jail and the company will collapse, finally allowing Potter to take over the town. Thinking of his wife, their young children, and others he loves will be better off with him dead, he contemplates suicide. \r\n'),
('Life Is Beautiful', 1997, 'Roberto Benigni', 8.6, 'Roberto Benigni\r\nRichard Sammel\r\nHorst Buchholz\r\nGiorgio Cantarini ', ' In 1930s Italy, a carefree Jewish book keeper named Guido starts a fairy tale life by courting and marrying a lovely woman from a nearby city. Guido and his wife have a son and live happily together until the occupation of Italy by German forces. In an attempt to hold his family together and help his son survive the horrors of a Jewish Concentration Camp, Guido imagines that the Holocaust is a game and that the grand prize for winning is a tank.\r\n'),
('Casablanca', 1942, 'Michael Curtiz', 8.5, 'Ingrid Bergman \r\nHumphrey Bogart \r\nPeter Lorre\r\nClaude Rains', ' The story of Rick Blaine, a cynical world-weary ex-patriate who runs a nightclub in Casablanca, Morocco during the early stages of WWII. Despite the pressure he constantly receives from the local authorities, Rick\'s cafe has become a kind of haven for refugees seeking to obtain illicit letters that will help them escape to America. But when Ilsa, a former lover of Rick\'s, and her husband, show up to his cafe one day, Rick faces a tough challenge which will bring up unforeseen complications, heartbreak and ultimately an excruciating decision to make.\r\n'),
('Gladiator', 2000, 'Ridley Scott', 8.5, 'Tommy Flanagan \r\nJoaquin Phoenix\r\nRussell Crowe \r\nRichard Harris', 'Maximus is a powerful Roman general, loved by the people and the aging Emperor, Marcus Aurelius. Before his death, the Emperor chooses Maximus to be his heir over his own son, Commodus, and a power struggle leaves Maximus and his family condemned to death. The powerful general is unable to save his family, and his loss of will allows him to get captured and put into the Gladiator games until he dies. The only desire that fuels him now is the chance to rise to the top so that he will be able to look into the eyes of the man who will feel his revenge.\r\n'),
('City Lights', 1931, 'Charles Chaplin', 8.5, 'Charles Chaplin\r\nJean Harlow\r\nBuster Brodie ', ' A tramp falls in love with a beautiful blind girl. Her family is in financial trouble. The tramp\'s on-and-off friendship with a wealthy man allows him to be the girl\'s benefactor and suitor.\r\n'),
('Modern Times', 1936, 'Charles Chaplin', 8.5, 'Charles Chaplin \r\nPaulette Goddard \r\nGloria DeHaven', 'Chaplin\'s last \'silent\' film, filled with sound effects, was made when everyone else was making talkies. Charlie turns against modern society, the machine age, (The use of sound in films ?) and progress. Firstly we see him frantically trying to keep up with a production line, tightening bolts. He is selected for an experiment with an automatic feeding machine, but various mishaps leads his boss to believe he has gone mad, and Charlie is sent to a mental hospital - When he gets out, he is mistaken for a communist while waving a red flag, sent to jail, foils a jailbreak, and is let out again. We follow Charlie through many more escapades before the film is out.\r\n'),
('Once Upon a Time in the West', 1968, 'Sergio Leone', 8.5, 'Claudia Cardinale \r\nCharles Bronson\r\nKeenan Wynn\r\nHenry Fonda', 'Story of a young woman, Mrs. McBain, who moves from New Orleans to frontier Utah, on the very edge of the American West. She arrives to find her new husband and family slaughtered, but by whom? The prime suspect, coffee-lover Cheyenne, befriends her and offers to go after the real killer, assassin gang leader Frank, in her honor. He is accompanied by Harmonica, a man already on a quest to get even.\r\n'),
('Champion', 2018, 'Ahmet Katiksiz', 8.5, 'Ekin Koç\r\nFarah Zeynep Abdullah \r\nFikret Kuskan', 'The champion is a great love story between Halis Karatas and Begum Atman, who came together with the legendary race horse Bold Pilot. Adapted from a true story, the film is owned by the prominent name of Turkish horseshoe Ozdemir Atman and the Bold Pilot is a horse that won the love of even those not interested in horse racing. Bold Pilot and his permanent jockey Halis Karatas together achieved unforgettable successes. The 2: 26: 22 record in the 1996 Gazi Race did not pass yet. Another success of the Bold Pilot is the presence of Halis Karatas and Begum Atman. Ahmet Katyksiz is sitting in the director\'s chair of the film, where he is the epic topic of love between the famous jockey and Begum Atman. Serkan Yoruk wrote the screenplay to the famous jockey Halis Karatas\'a Ekin Koc, while Begum Atman Farah Zeynep Abdullah gives life. The Jockey Club of Turkey Ozdemir Atman, the former president, played by veteran actor Fikret Kuskan.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('Creed 2', 2018, 'Steven Caple Jr.', 7.8, 'Michael B. Jordan，Sylvester Stallone，Tessa Thompson\r\n', 'Under the tutelage of Rocky Balboa, heavyweight contender Adonis Creed faces off against Viktor Drago, son of Ivan Drago. This movie is about going back to basics to rediscover what made you a champion in the first place, and remembering that, no matter where you go, you can’t escape your history.\r\n'),
('Bobby Robson: More Than a Manager', 2018, 'Gabriel Clarke，Torquil Jones', 8.3, 'Alex Ferguson，Gary Lineker，Alan Shearer', 'Bobby Robson was more than a manager. This movie is the definitive portrait of the English football manager, one of sport\'s most inspirational, influential figures, whose legacy lives on far beyond the football field.\r\n'),
('See You In Montevideo', 2014, 'Dragan Bjelogrlic', 8.5, 'Milos Bikovic，Petar Strugar，Armand Assante\r\n', 'A football team from Belgrade, in the former Yugoslavia Republic, win an opportunity to compete in the First World Football Championship, but things get complex along the journey.\r\n'),
('The Wrestler', 2008, 'Darren Aronofsky', 7.9, 'Mickey Rourke，Marisa Tomei，Evan Rachel Wood\r\n', 'Back in the 1980s, Robin Ramzinski was a star in the wrestling world. In present, his strength is fading and he is aging. Struggling to forget the past, he starts to work at a grocery store and forms a new relationship. Suddenly receive a offer for a re-match with his rival in the past, could it be the chance for him to bring back the fame ?\r\n'),
('Wont Back Down', 2014, 'John Lawlor， Clay Porter', 8.1, 'Gee Atherton，Josh Bryceland，Sam Hill', 'It\'s all for the children\'s future this time. Two mothers give all it takes to improve the local school that they think is having lots of trouble. Meanwhile the local powerful and entrenched bureaucracy do not agree with their idea to his own benefits.\r\n'),
('Creed', 2015, 'Ryan Coogler', 8.7, 'Michael B. Jordan，Sylvester Stallone，Tessa Thompson\r\n', 'Sylvester Stallone once again reprises his legendary role as World Heavyweight Boxing Champion Rocky Balboa. In this film, Rocky takes the responsibility to train the young Adonis Johnson, whose father was Rocky\'s respected old rival Apollo Creed.\r\n'),
('Ali', 2001, 'Michael Mann', 6.8, 'Will Smith，Jamie Foxx，Jon Voight', 'The movie is the biography of boxing great Muhammad Ali, which focuses on the ten-year period of 1964-1974, featuring his capture of the heavyweight title from Sonny Liston, his conversion to Islam to his reclaiming the title from George Foreman in the Rumble.\r\n'),
('M.S. Dhoni: The Untold Story', 2016, 'Neeraj Pandey', 8.1, 'Disha Patani. Kiara Advani,Bhumika Chawla,Anupam Kher,Sushant Singh Rajput\r\n', 'The film is based on the life of Indian cricketer and the current captain of the Indian national cricket team, Mahendra Singh Dhoni. It chronicles his life from a young age and the series of life events that finally culminates to his stardom in the realm of cricket.\r\n'),
('Azhar', 2016, 'Anthony DSouza', 6.3, 'Emraan Hashmi,Lara Dutta,Prachi Desai,Nargis Fakhri\r\n', 'The film chronicles the highs and lows of the life of Indian cricketer and former national team captain Mohammad Azharuddin who turns from being one of the most celebrated cricket captains of India to being country\'s most controversial sportsman yet.\r\n'),
('Slamma Jamma', 2017, 'Timothy A. Chey', 7.9, 'Chris Staples，Michael Irvin，Jose Canseco\r\n', 'Wrongfully accused and sent to prison, once promising college basketball player Michael Diggs (Chris Staples) prepares for the national slam dunk competition while finding redemption in himself and in those he loves.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `western`
--

CREATE TABLE `western` (
  `moviename` varchar(60) NOT NULL,
  `releasedate` year(4) NOT NULL,
  `director` varchar(40) NOT NULL,
  `IMDb` float NOT NULL,
  `cast` longtext NOT NULL,
  `synopsis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `western`
--

INSERT INTO `western` (`moviename`, `releasedate`, `director`, `IMDb`, `cast`, `synopsis`) VALUES
('Deadwood: The Movie', 2019, 'Daniel Minahan', 8.9, 'Robin Weigert\r\nTimothy Olyphant\r\nAnna Gunn\r\nIan McShane', 'Feature film based on the TV series, \'Deadwood\'.\r\n'),
('The Good, the Bad and the Ugly', 1966, 'Sergio Leone', 8.9, 'Clint Eastwood\r\nEli Wallach \r\nLee Van Cleef \r\nMario Brega ', 'Blondie (The Good) is a professional gunslinger who is out trying to earn a few dollars. Angel Eyes (The Bad) is a hit man who always commits to a task and sees it through, as long as he is paid to do so. And Tuco (The Ugly) is a wanted outlaw trying to take care of his own hide. Tuco and Blondie share a partnership together making money off Tuco\'s bounty, but when Blondie unties the partnership, Tuco tries to hunt down Blondie. When Blondie and Tuco come across a horse carriage loaded with dead bodies, they soon learn from the only survivor (Bill Carson) that he and a few other men have buried a stash of gold in a cemetery. Unfortunately Carson dies and Tuco only finds out the name of the cemetery, while Blondie finds out the name on the grave. Now the two must keep each other alive in order to find the gold. Angel Eyes (who had been looking for Bill Carson) discovers that Tuco and Blondie met with Carson and knows they know the location of the gold. \r\n'),
('Once Upon a Time in the West', 1968, 'Sergio Leone', 8.5, 'Claudia Cardinale\r\nCharles Bronson\r\nKeenan Wynn \r\nHenry Fonda ', 'Story of a young woman, Mrs. McBain, who moves from New Orleans to frontier Utah, on the very edge of the American West. She arrives to find her new husband and family slaughtered, but by whom? The prime suspect, coffee-lover Cheyenne, befriends her and offers to go after the real killer, assassin gang leader Frank, in her honor. He is accompanied by Harmonica, a man already on a quest to get even.\r\n'),
('Django Unchained', 2012, 'Quentin Tarantino', 8.4, 'Leonardo DiCaprio\r\nQuentin Tarantino\r\nChristoph Waltz\r\nSamuel L. Jackson ', 'In 1858, a bounty hunter named Schultz seeks out a slave named Django and buys him because he needs him to find some men he is looking for. After finding them, Django wants to find his wife, Broomhilda, who along with him were sold separately by his former owner for trying to escape. Schultz offers to help him if he chooses to stay with him and be his partner. Eventually they learn that she was sold to a plantation in Mississippi. Knowing they can\'t just go in and say they want her, they come up with a plan so that the owner will welcome them into his home and they can find a way.\r\n'),
('For a Few Dollars More', 1965, 'Sergio Leone', 8.3, 'Clint Eastwood \r\nLee Van Cleef \r\nSergio Leone \r\nKlaus Kinski', 'Manco is a bounty killer chasing El Indio and his gang. During his hunting, he meets Col. Douglas Mortimer, another bounty killer, and they decide to make a partnership, chase the bad guys together and split the reward. During their enterprise, there will be lots of bullets and funny situations. In the end, one of the bounty hunters shows the real intention of his hunting.\r\n'),
('The Gold Rush', 1925, 'Charles Chaplin', 8.2, 'Charles Chaplin', 'A lone prospector ventures into Alaska looking for gold. He gets mixed up with some burly characters and falls in love with the beautiful Georgia. He tries to win her heart with his singular charm.\r\n'),
('Unforgiven', 1992, 'Clint Eastwood', 8.2, 'Clint Eastwood\r\nMorgan Freeman \r\nRichard Harris \r\nGene Hackman ', 'The town of Big Whisky is full of normal people trying to lead quiet lives. Cowboys try to make a living. Sheriff \'Little Bill\' tries to build a house and keep a heavy-handed order. The town whores just try to get by.Then a couple of cowboys cut up a whore. Dissatisfied with Bill\'s justice, the prostitutes put a bounty on the cowboys. The bounty attracts a young gun billing himself as \'The Schofield Kid\', and aging killer William Munny. Munny reformed for his young wife, and has been raising crops and two children in peace. But his wife is gone. Farm life is hard. And Munny is no good at it. So he calls his old partner Ned, saddles his ornery nag, and rides off to kill one more time, blurring the lines between heroism and villainy, man and myth.\r\n'),
('The Treasure of the Sierra Madre', 1948, 'John Huston', 8.2, 'John Huston\r\nHumphrey Bogart \r\nRobert Blake\r\nJay Silverheels ', 'Fred C. Dobbs and Bob Curtin, both down on their luck in Tampico, Mexico in 1925, meet up with a grizzled prospector named Howard and decide to join with him in search of gold in the wilds of central Mexico. Through enormous difficulties, they eventually succeed in finding gold, but bandits, the elements, and most especially greed threaten to turn their success into disaster.\r\n'),
('The Man Who Shot Liberty Valance', 1962, 'John Ford', 8.1, 'John Wayne\r\nJames Stewart \r\nLee Marvin \r\nLee Van Cleef', 'When Senator Ransom Stoddard returns home to Shinbone for the funeral of Tom Doniphon, he recounts to a local newspaper editor the story behind it all. He had come to town many years before, a lawyer by profession. The stage was robbed on its way in by the local ruffian, Liberty Valance, and Stoddard has nothing to his name left save a few law books. He gets a job in the kitchen at the Ericson\'s restaurant and there meets his future wife, Hallie. The territory is vying for Statehood and Stoddard is selected as a representative over Valance, who continues terrorizing the town. When he destroys the local newspaper office and attacks the editor, Stoddard calls him out, though the conclusion is not quite as straightforward as legend would have it.\r\n'),
('Butch Cassidy and the Sundance Kid', 1969, 'George Roy Hill', 8.1, 'Sam Elliott \r\nPaul Newman \r\nRobert Redford \r\nCloris Leachman ', 'Butch and Sundance are the two leaders of the Hole-in-the-Wall Gang. Butch is all ideas, Sundance is all action and skill. The west is becoming civilized, and when Butch and Sundance rob a train once too often, a special posse begins trailing them no matter where they run. Over rocks, through towns, across rivers, the group is always just behind them. When they finally escape through sheer luck, Butch has another idea, \"Let\'s go to Bolivia\". Based on the exploits of the historical characters.\r\n');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
