//
//  ListTVC.swift
//  WeatherTestJunior
//
//  Created by Pavel on 12.05.2022.
//

import UIKit
class ListTVC: UITableViewController {
    let networkWeatherManager = NetworkWeatherManager()

    let emptyCity = Weather()
    var citiesArray = [Weather]()

    var nameCitiesArray = ["Воронеж", "Петербург", "Москва", "Иркутск", "Краснодар", "Уфа"]

    override func viewDidLoad() {
        super.viewDidLoad()

        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()

    }

    @IBAction func PressPlusButton(_ sender: Any) {
        allertPlusCity(name: "Горол", placeholder: "Введите название города") { (city) in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
    func addCities() {

        getCitiesWeather(citiesArray: self.nameCitiesArray) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
//            print(self.citiesArray)

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell

        var weather = Weather()
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)
        return cell
    }
//удаление ячейки по свайпу
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            let editingRow = self.nameCitiesArray[indexPath.row]

            if let index = self.nameCitiesArray.firstIndex(of: editingRow) {
                self.citiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }



//MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let IndexPath = tableView.indexPathForSelectedRow else { return }
            let cityWeather = citiesArray[IndexPath.row]
            let detailVC = segue.destination as! DetailViewController
            detailVC.modelWeather = cityWeather
        }
    }

}
