//
//  DetailViewController.swift
//  WeatherTestJunior
//
//  Created by Pavel on 17.05.2022.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {


    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempCity: UILabel!

    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!

//создадим переменную которая будет привязывать наши аутлеты
    var modelWeather: Weather?


    override func viewDidLoad() {
        super.viewDidLoad()
refreshLabels()

    }
    

    func refreshLabels() {

        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(modelWeather!.conditionCode).svg")

        let weatherImage = UIView(SVGURL: url!) {(image) in image.resizeToFit(self.viewCity.bounds)}
    self.viewCity.addSubview(weatherImage)

        nameCityLabel.text = modelWeather?.name
        tempCity.text = "\((modelWeather?.temperatureString)!)"
        tempMaxLabel.text = "\((modelWeather?.tempMax)!)"
        tempMinLabel.text = "\((modelWeather?.tempMin)!)"
        pressureLabel.text = "\((modelWeather?.pressureMm)!)"
        windSpeedLabel.text = "\((modelWeather?.windSpeed)!)"
        
    }






    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
