import UIKit

extension BookSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        bookSearchViewModel.searchBooks(with: query)
        searchBar.resignFirstResponder()
    }
}
