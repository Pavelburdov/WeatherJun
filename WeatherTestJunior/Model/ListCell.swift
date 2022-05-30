//
//  ListCell.swift
//  WeatherTestJunior
//
//  Created by Pavel on 16.05.2022.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet var nameCityLabel: UILabel!
    @IBOutlet var conditionCityLabel: UILabel!
    @IBOutlet var tempCityLabel: UILabel!


    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString

    }
}
