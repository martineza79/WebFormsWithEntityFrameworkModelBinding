using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;

namespace WebFormsWithEntityFrameworkModelBinding.Models
{
    public class ProductDB
    {
        HalloweenEntities db;

        public ProductDB()
        {
            db = new HalloweenEntities();
        }

        public IQueryable<Product> GetProducts()
        {
            return from p in db.Products
                   orderby p.Name
                   select p;
        }

        public Product GetProduct([Control] string grdProducts)
        {
            if (grdProducts == null)
                return (from p in db.Products
                        orderby p.Name
                        select p).FirstOrDefault();
            else
                return GetProductById(grdProducts);
        }

        private Product GetProductById(string id)
        {
            return (from p in db.Products
                    orderby p.Name
                    select p).FirstOrDefault();
        }

        public IQueryable<Category> GetCategories()
        {
            return from c in db.Categories
                   orderby c.LongName
                   select c;
        }

        public void InsertProduct(ModelMethodContext cxt)
        {
            var item = new Product();
            cxt.TryUpdateModel(item);

            if (cxt.ModelState.IsValid)
            {
                db.Products.Add(item);
                try
                {
                    db.SaveChanges();
                }

                catch (DbEntityValidationException ex)
                {
                    HandleValidationError(ex, cxt);
                }

                catch (Exception ex)
                {
                    HandleError(ex, cxt);
                }
            }
        }

        public void UpdateProduct(string ProductID, ModelMethodContext ctx)
        {
            Product item = GetProductById(ProductID);

            if (item == null)
            {
                ctx.ModelState.AddModelError("", $"Item with id {ProductID} was not found");
                return;
            }

            if (ctx.ModelState.IsValid)
            {
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    HandleConcurrencyError(ex, ctx, IsEdit: true);
                }
                catch (DbEntityValidationException ex)
                {
                    HandleValidationError(ex, ctx);
                }
                catch (Exception ex)
                {
                    HandleError(ex, ctx);
                }
            }
        }

        public void DeleteProduct(string ProductID, ModelMethodContext ctx)
        {
            Product item = GetProductById(ProductID);

            if (item != null)
            {
                db.Products.Remove(item);
                try
                {
                    db.SaveChanges();
                }

                catch (DbUpdateConcurrencyException ex)
                {
                    HandleConcurrencyError(ex, ctx, IsEdit: false);
                }

                catch(Exception ex)
                {
                    HandleError(ex, ctx);
                }
            }
        }
        private void HandleConcurrencyError(DbUpdateConcurrencyException ex,
            ModelMethodContext cxt, bool IsEdit)
        {
            ex.Entries.Single().Reload();
            if (IsEdit)
                cxt.ModelState.AddModelError("", "Another user changed that product. "
                + "Click Cancel to see changes.");
            else
                cxt.ModelState.AddModelError("", "Another user deleted that product.");
        }

        private void HandleValidationError(DbEntityValidationException ex,
            ModelMethodContext cxt)
        {
            foreach (var ve in ex.EntityValidationErrors)
            {
                foreach (var e in ve.ValidationErrors)
                {
                    cxt.ModelState.AddModelError("", $"Error: {e.ErrorMessage}");
                }
            }
        }

        private void HandleError(Exception ex,
            ModelMethodContext cxt)
        {
            cxt.ModelState.AddModelError("",
                $"Database error: {GetExceptionMessages(ex)}");
        }

        private string GetExceptionMessages(Exception e)
        {
            if (e == null) return string.Empty;
            string msg = e.Message;
            // recursively call inner exceptions until you get to the last one
            if (e.InnerException != null)
                msg = GetExceptionMessages(e.InnerException);
            return msg;
        }
    }
}