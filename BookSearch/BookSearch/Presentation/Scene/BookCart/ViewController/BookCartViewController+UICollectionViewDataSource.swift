import UIKit

extension BookCartViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        bookCartViewModel.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CartCell.id,
            for: indexPath
        ) as? CartCell
        else {
            return UITableViewCell()
        }
        let book = bookCartViewModel.books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}
