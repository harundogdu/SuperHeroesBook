//
//  ViewController.swift
//  SuperHeroesBook
//
//  Created by Harun on 5.06.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // tableView
    @IBOutlet weak var tableView: UITableView!
    // heroes
    var heroesName = [String]()
    var heroesImageName = [String]()
    var heroesDescription = [String]()
    //
    var selectedHeroName = ""
    var selectedHeroImageName = ""
    var selectedHeroDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        heroesName.append("Batman")
        heroesName.append("Superman")
        heroesName.append("Spiderman")
        heroesName.append("Captain America")
        heroesName.append("Ironman")
        
        heroesImageName.append("batman")
        heroesImageName.append("superman")
        heroesImageName.append("spiderman")
        heroesImageName.append("captainamerica")
        heroesImageName.append("ironman")
        
        heroesDescription.append("Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth.")
        heroesDescription.append("Superman is a fictional superhero who first appeared in American comic books published by DC Comics. ... He was found and adopted by farmers Jonathan and Martha Kent, who named him Clark Kent. Clark developed various superhuman abilities, such as incredible strength and impervious skin.")
        heroesDescription.append("Spider-Man's Powers and Abilities: Superhuman strength, agility, endurance, ability to stick to and climb walls and other surfaces, uses self-designed web-shooters allowing him to fire and swing from sticky webs, special 'Spider-Sense' warns of incoming danger, genius intellect specializing in chemistry and invention.")
        heroesDescription.append("Captain America is the alter ego of Steve Rogers, a frail young artist enhanced to the peak of human perfection by an experimental 'super-soldier serum' after joining the military to aid the United States government's efforts in World War II.")
        heroesDescription.append("Genius level intellect Proficient scientist and engineer Powered armor suit: Superhuman strength, speed, durability, agility, reflexes, and senses Supersonic flight Energy repulsor and missile projection Regenerative life support")
    }
    
    // show item

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = heroesName[indexPath.row]
        return cell
    }
    
    // delete item
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            heroesImageName.remove(at: indexPath.row)
            heroesName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    // select item
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedHeroName = heroesName[indexPath.row]
        selectedHeroImageName = heroesImageName[indexPath.row]
        selectedHeroDescription = heroesDescription[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    // second VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! toDetailsViewController
            destinationVC.selectedHeroesImage = selectedHeroImageName
            destinationVC.selectedHeroesName = selectedHeroName
            destinationVC.selectedHeroesDescription = selectedHeroDescription
        }
    }

}

