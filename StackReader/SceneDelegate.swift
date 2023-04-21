//
//  SceneDelegate.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator : MainCoordinator?
 
  

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
       
        //1:
        guard let windowScene = (scene as? UIWindowScene) else{ return}
        
        //2:
        let AppWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        AppWindow.windowScene = windowScene
        
        //3:
        let navController = UINavigationController()
        let model = createViewModel()
        coordinator = MainCoordinator(navigationController: navController, viewModel: model)

        coordinator?.start()
        
        //4:
        AppWindow.rootViewController = navController
        AppWindow.makeKeyAndVisible()
        
        //5:
        window = AppWindow

    }
    
    func createViewModel() -> QuestionViewModel {
            let urlBuilder : URLBuilderProtocol = URLBuilder()
            let imageDownloader : ImageDownloaderProtocol = ImageDownloader()
            let dateConverter : DateConverterProtocol = DateConverter()

            let jsonParser : JsonDecoderProtocol =  JsonParser(downloader: imageDownloader, dateConverter: dateConverter)
            let coreDataService : DataServiceProtocol = CoreDataService(urlBuilder: urlBuilder, jsonParser: jsonParser)
            let apiService : DataServiceProtocol = ApiService(urlBuilder: urlBuilder, jsonParser: jsonParser)
            let questionViewModel = QuestionViewModel(coreDataService: coreDataService, apiService: apiService)
            return questionViewModel
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
 
    }


}

