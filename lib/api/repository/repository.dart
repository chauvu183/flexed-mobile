import 'package:flexed_mobile/models/model.dart';

/// Represents a database connection that creates, fetches, 
/// manipulates and deletes model instances.
abstract class Repository<T extends Model> {

  /// Create a new model instance
  Future<T> create(T model);

  /// Fetch a list of available models
  Future<List<T>> index();

  /// Fetch specified model by primary key
  Future<T> show(int key);

  /// Persist changes to given model
  Future<T> update(T model);

  /// Delete a given model. Returns true if successful
  Future<bool> delete(int key);
}
