//
//  NewsListPresenter.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import BusinessLayer

public final class NewsListPresenter: BasePresenter<NewsListView> {
    // MARK: - Properties
    public weak var view: NewsListView!
    
    // MARK: Coordinator protocol
    private var coordinator: NewsListCoordinator
    
    private var state: NewsListState
    
    // MARK: - UseCases
    private let popularNewsUseCase: PopularNewsUseCase
    
    // MARK: - Init
    public init(
        coordinator: NewsListCoordinator,
        state: NewsListState,
        popularNewsUseCase: PopularNewsUseCase
    ) {
        self.coordinator = coordinator
        self.state = state
        self.popularNewsUseCase = popularNewsUseCase
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        fetchNews()
    }
    
}

// MARK: - Present methods
extension NewsListPresenter {
    
    private func presentNews() {
        let news = state.getNewsList()
        let viewModel = createNewsListViewModel(news)
        
        view.update(with: viewModel)
    }
    
}

// MARK: - Private methods
extension NewsListPresenter {
    
    private func fetchNews() {
        let page = state.getCurrentPage()
        
        view.startLoading()
        popularNewsUseCase.fetchNews(page: page) { [weak self]  result in
            self?.handleNewsResult(result)
        }
    }
    
}

// MARK: - CreatingViewModels
extension NewsListPresenter {
    
    private func createNewsListViewModel(_ news: [News]) -> [NewsViewModel] {
        let viewModel = news.compactMap { news in
            NewsViewModel(
                title: news.title,
                description: news.description,
                imageURL: news.imageURL,
                author: news.author,
                content: news.content,
                didSelectNews: {
                    self.coordinator.navigateToNewsDetails(with: news.id)
                },
                didReachNews: { section in
                    let lastFetchedSection = self.state.getNewsList().count - 1
                    guard lastFetchedSection == section else { return }
                    let currentPage = self.state.getCurrentPage()
                    let totalPages = self.state.getTotalPages()
                    
                    guard currentPage < totalPages else { return }
                    self.state.incrementCurrentPage()
                    
                    self.fetchNews()
                }
            )
        }
        return viewModel
    }
    
}

// MARK: - Private helpers
extension NewsListPresenter {
    
    private func handleNewsResult(_ result: Result<(totalPages: Int, news:[News]), Error>) {
        switch result {
        case .success(let response):
            state.setTotalPages(pages: response.totalPages)
            state.setNewsList(list: response.news)
            presentNews()
        case .failure(let error):
            self.view.showError(with: "Error", and: error.localizedDescription)
        }
        
        self.view.stopLoading()
    }
    
}
