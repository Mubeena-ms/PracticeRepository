using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HandsOnAssignmentEF.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Books",
                columns: table => new
                {
                    BookId = table.Column<int>(type: "int", nullable: false),
                    BookName = table.Column<string>(type: "varchar(30)", maxLength: 30, nullable: false),
                    Price = table.Column<int>(type: "int", nullable: false),
                    Author = table.Column<string>(type: "varchar(30)", maxLength: 30, nullable: true),
                    Language = table.Column<string>(type: "varchar(30)", maxLength: 30, nullable: true),
                    ReleaseDate = table.Column<DateTime>(type: "Date", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Books", x => x.BookId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Books");
        }
    }
}
