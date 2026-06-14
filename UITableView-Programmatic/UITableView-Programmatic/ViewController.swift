//
//  ViewController.swift
//  UITableView-Programmatic
//
//  Created by Pranav Bawgikar on 12/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        videos = fetchData()
        view.backgroundColor = .systemBackground
        title = "P's Videos"
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self // self is the ViewController
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row] // What video to put in the cell
        cell.set(video: video)
        return cell
    }
}

extension ViewController {
    func fetchData() -> [Video] {
        let video1 = Video(image: Images.noStoryboard, title: "Steal moon (research phase)")
        let video2 = Video(image: Images.softSkills, title: "Investigate angry goose")
        let video3 = Video(image: Images.shake, title: "Benchmark screaming into void")
        let video4 = Video(image: Images.wireless, title: "Check under bed for parallel universe")
        let video5 = Video(image: Images.patreon, title: "Feed office velociraptor")
        let video6 = Video(image: Images.xcode, title: "Determine if cereal is soup")
        let video7 = Video(image: Images.ninety, title: "Become local legend")
        let video8 = Video(image: Images.raise, title: "Recurs every 17 minutes")
        let video9 = Video(image: Images.salaries, title: "Optimize blanket-to-couch ratio")
        let video10 = Video(image: Images.swiftNews, title: "Translate cat's demands")
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}
